# Test Task to Send to Redis
# setwd("/home/hammadtheone/Documents/redis_test")

library(redux)
library(rworker)
library(magrittr)
library(callr)
library(jsonlite)
library(R6)
library(later)

url <- 'redis://localhost:6379'
rwork <- rworker(name='celery', queue=url, backend=url, workers=2)

con <- redux::hiredis()

task_with_progress <- (function() {
  task_progress("Started")
  10+10
  }
) %>% rwork$task(name="task_with_progress")

test_function <-(function(){
  task_progress("Task Started")
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
  
  sample_data_frame <- data.frame(fread(file = "/home/hammadtheone/Documents/redis_test/data/sample_RNA.csv",
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
  
  task_progress(25)
  
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
  task_progress(75)
  
  names(new.cluster.ids) <- levels(cbmc)
  cbmc <- suppressMessages(RenameIdents(cbmc, new.cluster.ids))
  
  final_plot <- ggplotly(DimPlot(cbmc))
  
  task_progress(100)
  
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

# Notes: 
# Create a task using $create_task(), or directly supply a task function to
# $queue_task(). Otherwise, supplying a task name matching one in tasks_list() will 
# also be pushed to the Redis queue. After that, use TaskQueueR::rwork$consume() to 
# spawn the worker processes to execute the tasks. 


R6_Task_QueueR <- R6Class("TaskQueueR", 
  public = list(
    con = redux::hiredis(),
    worker_list = list(),
    tasks_list = list(),
    rwork = rworker(name='celery', queue='redis://localhost:6379', backend='redis://localhost:6379', workers=2),
    
    create_task = function(FUN, task_name = id_generator(1)) {
      if(!is.function(FUN) && !is.null(FUN)) stop("Task must be defined as a function.")
      self$tasks_list[[task_name]] <- list(FUN, "CREATED")
      invisible(self)
    },
    
    queue_task = function(task = NULL, task_name = private$id_generator(1), priority = 0, delivery_tag = "default_delivery"){
      if(!is.function(task) && !is.null(task)) stop("Task must be defined as a function.")
      
      if(task_name %in% names(self$tasks_list)) {
        self$rwork$task(FUN = self$tasks_list[[task_name]][[1]], name = task_name)
        self$tasks_list[[task_name]][[2]] = "QUEUED"
      }
      else if (!(task_name %in% names(self$tasks_list))) {
        self$tasks_list[[task_name]] = list(task, "QUEUED")
        self$rwork$task(FUN = task, name = task_name)
      }
    
      task_structure <- list(
        "body" = "W1tdLCB7fSwgeyJjYWxsYmFja3MiOiBudWxsLCAiZXJyYmFja3MiOiBudWxsLCAiY2hhaW4iOiBudWxsLCAiY2hvcmQiOiBudWxsfV0=",
        "content-encoding" = "utf-8",
        "content-type" = "application/json",
        "headers" = list(
          "lang" = "py",
          "task" = task_name,
          "id" = task_name,
          "shadow" = NULL,
          "eta" = "2019-12-11T20:02:48.449258+00:00",
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
      
      
      task_JSON <- private$to_JSON(task_structure)

      self$con$RPUSH("celery", task_JSON)
      
      self$con$RPUSH("task_list", object_to_string(self$rwork$tasks))
      
      invisible(self)
    },
    
    spawn_worker = function(workers = 2) {
      rp <- callr::r_bg(function() {
        library(redux)
        library(rworker)
        library(magrittr)
        library(callr)
        library(jsonlite)
        library(R6)
        library(later)
        
        con <- redux::hiredis()
        
        rwork = rworker(name='celery', queue='redis://localhost:6379', 
                        backend='redis://localhost:6379', workers=1)
        
        task_list <- con$LRANGE("task_list", 0, -1)
        
        for (task in task_list) {
          object <- string_to_object(task)
          rwork$task(FUN = object[[1]], name = names(object))
        }
        
        rwork$consume()
      })
    },
    
    task_status = function(task_name) {
      if (!(task_name %in% names(self$tasks_list))) stop("Task does not exist or has not been created.")
      
      return(self$tasks_list[[task_name]][[2]])
    },
    
    task_result = function(task_name) {
      if (!(task_name %in% names(self$rwork$tasks))) stop("Task does not exist or has not been queued.")
      
      tryCatch(
        expr = {
          result_JSON <- self$con$GET(paste0("celery-task-meta-", task_name))
          
          result_string <- fromJSON(result_JSON)
          
          return(result_string$result$result)
        },
        error = function(e) {
          message("Error! Task may have failed or has not been executed yet. See error below.")
          print(e)
        },
        warning = function(w) {
          message("Warning! Check syntax or task structure. See warning below.")
          print(w)
        },
        finally = {
          message("Quitting...")
        }
      )
    }
  ),
  private = list(
    id_generator = function(n = 1000) {
      generate_letters <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
      paste0(generate_letters, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
    },
    
    to_JSON = function (x, ...) {
      jsonlite::toJSON(x, digits = 50, auto_unbox = TRUE, force = TRUE, 
                       null = "null", na = "null", ...)
    }
  )
)


TaskQueueR <- function(){
  R6_Task_QueueR$new()
}


#  Some random tests to make sure it's not falling apart.

test_request <- TaskQueueR()

test_request$create_task(test_function, "third_test")

test_request$task_status("third_test")

test_request$queue_task(task_name = "third_test")

test_request$task_status("third_test")

test_request$rwork$tasks

test_request$spawn_worker()

string_to_object(test_request$task_result("third_test"))

# Example of the format for ETA, if that ever works - 2019-12-10T15:56:12.494179+00:00


test_request$rwork$collect_report()

queue_task = function(interval = 10) {
  print("Task Queued")
  later::later(queue_task, interval)
}

test_request$queue_task(function(){1+1})


## start all bg sessions
s1 <- callr::r_bg(function() rworker::rworker(workers = 4)$consume())
s2 <- callr::r_bg(function() Sys.sleep(4))
s3 <- callr::r_bg(function() Sys.sleep(7))

s1$wait()
s2$wait()
s3$wait()


rp <- callr::r_bg(function() {
  library(redux)
  library(rworker)
  library(magrittr)
  library(callr)
  library(jsonlite)
  library(R6)
  library(later)
  
  con <- redux::hiredis()
  
  rwork = rworker(name='celery', queue='redis://localhost:6379', 
                  backend='redis://localhost:6379', workers=2)
  
  task_list <- con$LRANGE("task_list", 0, -1)
  
  for (task in task_list) {
    object <- string_to_object(task)
    rwork$task(FUN = object[[1]], name = names(object))
  }
  
  rwork$consume()
})

n <- "
<!DOCTYPE html>
<html>
  <head>
    {%metas%}
    <title>{%title}</title>
    {%favicon%}
    {%css%}
    <script>function(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-N6T2RXG');</script>
  </head>
  

"
