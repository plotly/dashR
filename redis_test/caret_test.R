library(plotly)
library(caret)
library(Seurat)
library(ggplot2)
library(dplyr)
library(data.table)

dataset <- iris

validation_index <- createDataPartition(dataset$Species, p=0.80, list = FALSE)

validation <- dataset[-validation_index,]

dataset <- dataset[validation_index,]

summary(dataset)

# split input and output
x <- dataset[,1:4]
y <- dataset[,5]


# read RNA data
cbmc.rna <- as.sparse(read.csv(file = "data/GSE100866_CBMC_8K_13AB_10X-RNA_umi_sample.csv", header = TRUE, row.names = 1))
cbmc.rna <- CollapseSpeciesExpressionMatrix(cbmc.rna)

# read protein data
cbmc.adt <- as.sparse(read.csv(file = "data/GSE100866_CBMC_8K_13AB_10X-ADT_umi.csv", header = TRUE, row.names = 1))
# remove CCR5, CC7, and CD10 duo to low quality
cbmc.adt <- cbmc.adt[setdiff(rownames(cbmc.adt), c("CCR5", "CCR7", "CD10")), ]

# Create a Seurat object that serves as a container for both data and analyses
cbmc <- CreateSeuratObject(counts = cbmc.rna)

# QC based on number of unique genes and percentage of reads mapped to the mitochondrial genome
# cbmc[["percent.mt"]] <- PercentageFeatureSet(cbmc, pattern = "^MT-")
# cbmc <- subset(cbmc, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)

# normalize data for each cell by total expression
cbmc <- NormalizeData(cbmc)

# identify highly variable features
cbmc <- FindVariableFeatures(cbmc)

# scale data so that the mean is 0 and variance is 1 for each gene
cbmc <- ScaleData(cbmc)

# PCA 
cbmc <- RunPCA(cbmc, verbose = FALSE)
ElbowPlot(cbmc, ndims = 50)

# Construct a KNN graph
cbmc <- FindNeighbors(cbmc, dims = 1:25)

# group cells together
cbmc <- FindClusters(cbmc, resolution = 0.8)

cbmc <- RunTSNE(cbmc, dims = 1:25, method = "FIt-SNE")
DimPlot(cbmc)

# identify markers for each cluster
cbmc.rna.markers <- suppressMessages(
  FindAllMarkers(cbmc, max.cells.per.ident = 100, min.diff.pct = 0.3, only.pos = TRUE))

cbmc.rna.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_logFC)

# rename clusters with cell type
new.cluster.ids <- c("Memory CD4 T", "CD14+ Mono", "Naive CD4 T", "NK", "CD14+ Mono", "Mouse", "B", 
                     "CD8 T", "CD16+ Mono", "T/Mono doublets", "NK", "CD34+", "Multiplets", "Mouse", "Eryth", "Mk", 
                     "Mouse", "DC", "pDCs")

names(new.cluster.ids) <- levels(cbmc)
cbmc <- suppressMessages(RenameIdents(cbmc, new.cluster.ids))
DimPlot(cbmc, label = TRUE) + NoLegend()


app <- Dash$new()

z <- rna_cluster(sample_data)[[1]]

app$layout(
  dccGraph(id = 'no',
           figure = z)
)

app$run_server(showcase = TRUE)




sample_data_protein <- as.sparse(read.csv(file = "data/GSE100866_CBMC_8K_13AB_10X-ADT_umi.csv", header = TRUE, row.names = 1))

sample_data_protein <- sample_data_protein[setdiff(rownames(sample_data_protein), c("CCR5", "CCR7", "CD10")), ]

rna_data <- sample_data


protein_cluster <- function(rna_data){
  
  cbmc <- CreateSeuratObject(counts = rna_data)
  
  # normalize data for each cell by total expression
  cbmc <- NormalizeData(cbmc)
  
  # identify highly variable features
  cbmc <- FindVariableFeatures(cbmc)
  
  # scale data so that the mean is 0 and variance is 1 for each gene
  cbmc <- ScaleData(cbmc)
  
  # PCA 
  cbmc <- RunPCA(cbmc, verbose = FALSE)
  
  # Construct a KNN graph
  cbmc <- FindNeighbors(cbmc, dims = 1:25)
  
  # group cells together
  cbmc <- FindClusters(cbmc, resolution = 0.8)
  
  cbmc <- RunTSNE(cbmc, dims = 1:25, method = "FIt-SNE")
  
  # identify markers for each cluster
  cbmc.rna.markers <- suppressMessages(
    FindAllMarkers(cbmc, max.cells.per.ident = 100, min.diff.pct = 0.3, only.pos = TRUE))
  
  cbmc[["ADT"]] <- CreateAssayObject(counts = cbmc.adt)
  
  # normalization using the CLR method
  cbmc <- NormalizeData(cbmc, assay = "ADT", normalization.method = "CLR")
  cbmc <- ScaleData(cbmc, assay = "ADT")
  
  DefaultAssay(cbmc) <- "ADT"
  
  # calculate euclidean distance matrix
  adt.data <- GetAssayData(cbmc, slot = "data")
  adt.dist <- dist(t(adt.data))
  
  # RNA clustering ids
  cbmc[["rnaClusterID"]] <- Idents(cbmc)
  
  # tSNE
  cbmc[["tsne_adt"]] <- RunTSNE(adt.dist, assay="ADT", reduction.key="adtTSNE_")
  
  # clustering
  cbmc[["adt_snn"]] <- FindNeighbors(adt.dist)$snn
  cbmc <- FindClusters(cbmc, resolution=0.2, graph.name="adt_snn")
  
  
  # label clusters
  new.cluster.ids <- c("CD4 T", "CD14+ Mono", "NK", "B", "CD8 T", "NK", "CD34+", "T/Mono doublets", 
                       "CD16+ Mono", "pDCs", "B")
  
  names(new.cluster.ids) <- levels(cbmc)
  cbmc <- RenameIdents(cbmc, new.cluster.ids)
  
  tsne_adtClusters <- ggplotly(DimPlot(cbmc, reduction="tsne_adt"))
  
  return(list(tsne_adtClusters))
}

