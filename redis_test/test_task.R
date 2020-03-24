# Test Task to Send to Redis

library(rworker)
library(magrittr)

url <- 'redis://localhost:6379'
rwork <- rworker(name='celery', queue=url, backend=url, workers=2)

con <- redux::hiredis()

(function(){
  library(plotly)
  library(redux)
  Sys.sleep(5)
  task_progress(25) # 50% progress
  Sys.sleep(5)
  task_progress(70)
  task_progress(100) # 100% progress
  plot <- plot_ly(data = iris, x = iris$Sepal.Length, y = iris$Sepal.Length)
  return(object_to_string(plot))
}) %>% rwork$task(name='task_progress')


test_list <- list(
  "body" = "W1tdLCB7fSwgeyJjYWxsYmFja3MiOiBudWxsLCAiZXJyYmFja3MiOiBudWxsLCAiY2hhaW4iOiBudWxsLCAiY2hvcmQiOiBudWxsfV0=",
  "content-encoding" = "utf-8",
  "content-type" = "application/json",
  "headers" = list(
    "lang" = "py",
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

test_JSON <- to_JSON(test_list)

con$RPUSH("celery", test_JSON)

rwork$consume()

# To access results 

# z <- con$GET("celery-task-meta-example_task")
# 
# z <- fromJSON(z)
# 
# string_to_object(z$result$result)
