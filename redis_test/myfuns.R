task <- my_queue$enqueue({
  library(plotly)
  library(dash)
  library(dashCoreComponents)
  library(dashHtmlComponents)
  library(caret)
  library(redux)
  library(Seurat)
  library(ggplot2)
  library(dplyr)
  library(data.table)
  library(readr)
  library(rrq)
  
  setwd("/home/hammadtheone/Documents/redis_test")
  
  cbmc <- CreateSeuratObject(counts = sample_data)
  
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
  
  markers_table <- cbmc.rna.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_logFC)
  
  # rename clusters with cell type
  new.cluster.ids <- c("Memory CD4 T", "CD14+ Mono", "Naive CD4 T", "NK", "CD14+ Mono", "Mouse", "B", 
                       "CD8 T", "CD16+ Mono", "T/Mono doublets", "NK", "CD34+", "Multiplets", "Mouse", "Eryth", "Mk", 
                       "Mouse", "DC", "pDCs")
  
  names(new.cluster.ids) <- levels(cbmc)
  cbmc <- suppressMessages(RenameIdents(cbmc, new.cluster.ids))
  
  final_plot <- ggplotly(DimPlot(cbmc))
})