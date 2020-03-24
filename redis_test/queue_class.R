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
                            
                            create_task = function(fun, task_name = id_generator(1)) {
                              self$tasks_list[[task_name]] <- fun
                              invisible(self)
                            },
                            
                            queue_task = function(task = NULL, task_name = private$id_generator(1), priority = 0, delivery_tag = "default_delivery"){
                              if(!is.function(task) && !is.null(task)) stop("Task must be defined as a function.")
                              
                              if(task_name %in% names(self$tasks_list)) {
                                self$rwork$task(FUN = self$tasks_list[[task_name]], name = task_name)
                              }
                              else if (!(task_name %in% names(self$tasks_list))) {
                                self$tasks_list[[task_name]] = task
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
                              invisible(self)
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