from celery import Celery

url = 'redis://localhost:6379/0'
worker = Celery('app', broker=url, backend=url)
async_result = worker.send_task('task_with_progress')

# Check task state
async_result.state

