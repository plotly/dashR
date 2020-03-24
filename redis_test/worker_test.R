library(redux)
library(rworker)
library(magrittr)
library(callr)
library(jsonlite)
library(R6)
library(later)

setwd("home/hammadtheone/Documents/redis_test")

con <- redux::hiredis()

rwork = rworker(name='celery', queue='redis://localhost:6379', 
                backend='redis://localhost:6379', workers=2)

task_list <- con$LRANGE("task_list", 0, -1)

for (task in task_list) {
  object <- string_to_object(task)
  rwork$task(FUN = object[[1]], name = names(object))
}

rwork$consume()
