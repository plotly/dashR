# Test Task to Send to Redis
#setwd("/home/hammadtheone/Documents/redis_test")

library(rworker)
library(magrittr)
library(callr)
library(jsonlite)

url <- 'redis://localhost:6379'
rwork <- rworker(name='celery', queue=url, backend=url, workers=2)

con <- redux::hiredis()

test_function <- (function(){
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
  
  sample_data_frame <- data.frame(fread(file = "data/sample_RNA.csv",
                                        header = TRUE), row.names = 1)
  
  
  sample_data <- as.sparse(sample_data_frame)
  sample_data <- CollapseSpeciesExpressionMatrix(sample_data)
  
  cbmc <- CreateSeuratObject(counts = sample_data)
  
  # normalize data for each cell by total expression
  cbmc <- NormalizeData(cbmc)
  
  # identify highly variable features
  cbmc <- FindVariableFeatures(cbmc)
  
  # scale data so that the mean is 0 and variance is 1 for each gene
  cbmc <- ScaleData(cbmc)
  
  task_progress(20)
  
  # PCA 
  cbmc <- RunPCA(cbmc, verbose = FALSE)
  
  # Construct a KNN graph
  cbmc <- FindNeighbors(cbmc, dims = 1:25)
  
  # group cells together
  cbmc <- FindClusters(cbmc, resolution = 0.8)
  
  cbmc <- RunTSNE(cbmc, dims = 1:25, method = "FIt-SNE")
  
  task_progress(50)
  
  # identify markers for each cluster
  cbmc.rna.markers <- suppressMessages(
    FindAllMarkers(cbmc, max.cells.per.ident = 100, min.diff.pct = 0.3, only.pos = TRUE))
  
  markers_table <- cbmc.rna.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_logFC)
  
  # rename clusters with cell type
  new.cluster.ids <- c("Memory CD4 T", "CD14+ Mono", "Naive CD4 T", "NK", "CD14+ Mono", "Mouse", "B", 
                       "CD8 T", "CD16+ Mono", "T/Mono doublets", "NK", "CD34+", "Multiplets", "Mouse", "Eryth", "Mk", 
                       "Mouse", "DC", "pDCs")
  task_progress(90)
  
  names(new.cluster.ids) <- levels(cbmc)
  cbmc <- suppressMessages(RenameIdents(cbmc, new.cluster.ids))
  
  final_plot <- ggplotly(DimPlot(cbmc))
  return(object_to_string(final_plot))
}) %>% rwork$task(name='task_progress')


test_list <- list(
  "body" = "W1tdLCB7fSwgeyJjYWxsYmFja3MiOiBudWxsLCAiZXJyYmFja3MiOiBudWxsLCAiY2hhaW4iOiBudWxsLCAiY2hvcmQiOiBudWxsfV0=",
  "content-encoding" = "utf-8",
  "content-type" = "application/json",
  "headers" = list(
    "lang" = "r",
    "task" = "task_progress",
    "id" = "example_task",
    "shadow" = NULL,
    "eta" = NULL,
    "expires" = NULL,
    "group" = NULL,
    "retries" = 0,
    "timelimit" = c(NA, NA),
    "root_id" = "example_task",
    "parent_id" = NULL, 
    "argsrepr" = "()",
    "kwargsrepr" = "{}",
    "origin" = "gen20383@hammad-XPS-13-9360"
  ),
  "properties" = list(
    "correlation_id" = "example_task",
    "reply_to" = "example_deliver",
    "delivery_mode" = 2,
    "delivery_info" = list(
      "exchange" = "",
      "routing_key" = "celery"
    ),
    "priority" = 0,
    "body_encoding" = "base64",
    "delivery_tag" = "example_deliver"
  )
)

to_JSON <- function (x, ...) 
{
  jsonlite::toJSON(x, digits = 50, auto_unbox = TRUE, force = TRUE, 
                   null = "null", na = "null", ...)
}

test_JSON <- to_JSON(test_list)

con$RPUSH("celery", test_JSON)

rwork$consume()

# To access results

# z <- con$GET("celery-task-meta-example_task")
#
# z <- fromJSON(z)
#
# string_to_object(z$result$result)


#R6 Class for Task

id_generator <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

R6_Task_Request <- R6::R6Class(
  "TaskRequest", 
  public = list(
    con = redux::hiredis(),
    url = 'redis://localhost:6379',
    worker_list = list(),
    tasks_list = list(),
    rwork = rworker(name='celery', queue=url, backend=url, workers=2),
    
    create_task = function(fun, task_name = id_generator(1)) {
      append(self$tasks_list, c(task_name = fun))
    },
    
    queue_task = function(task, task_name = id_generator(1), priority = 0, delivery_tag = "default_delivery"){
      task_list <- list(
        "body" = "W1tdLCB7fSwgeyJjYWxsYmFja3MiOiBudWxsLCAiZXJyYmFja3MiOiBudWxsLCAiY2hhaW4iOiBudWxsLCAiY2hvcmQiOiBudWxsfV0=",
        "content-encoding" = "utf-8",
        "content-type" = "application/json",
        "headers" = list(
          "lang" = "py",
          "task" = ifelse(task_name %in% self$tasks_list, 
                          self$rwork$task(self$tasks_list[[task_name]], name = task_name), 
                          task_name),
          "id" = task_name,
          "shadow" = NULL,
          "eta" = NULL,
          "expires" = NULL,
          "group" = NULL,
          "retries" = 0,
          "timelimit" = c(NA, NA),
          "root_id" = task_name,
          "parent_id" = NULL, 
          "argsrepr" = "()",
          "kwargsrepr" = "{}",
          "origin" = Sys.info()[['nodename']]
        ),
        "properties" = list(
          "correlation_id" = task_name,
          "reply_to" = delivery_tag,
          "delivery_mode" = 2,
          "delivery_info" = list(
            "exchange" = "",
            "routing_key" = "celery"
          ),
          "priority" = priority,
          "body_encoding" = "base64",
          "delivery_tag" = delivery_tag
        )
      )
      
      task_JSON <- to_JSON(task_list)
      
      self$con$RPUSH("celery", task_JSON)
    },
    
    task_result = function(task_name) {
      result = self$con$GET()
    }
    
    spawn_worker = function(){
      self$rwork$consume()
      invisible(self)
    }
  )
)


TaskRequest <- function(){
  R6_Task_Request$new()
}


test_request <- TaskRequest()

test_request$queue_task(task = "task_progress", task_name = "first_task")
test_request$queue_task(task = "task_progress", task_name = "second_task")

library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)



app <- Dash$new()

yearMarks <- lapply(unique(rownames(mtcars)), as.character)
names(yearMarks) <- as.character(1:32)

# app$layout(htmlDiv(list(
#   dccRangeSlider(
                        #     marks = setNames(lapply(-5:6, function(x) paste("Label", x)), as.character(-5:6)),
#     min = -5,
#     max = 6,
#     value = list(-3,4)
#   )
# )))

app$layout(htmlDiv(list(
  dccRangeSlider(
    marks = setNames(lapply(rownames(mtcars)[1:10], function(x)
      paste("Label", x)), as.character(1:10)),
    min = 1,
    max = 10,
    value = list(4)
  )
)))


app$run_server(showcase = TRUE)




