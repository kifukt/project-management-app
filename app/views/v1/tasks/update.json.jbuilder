json.data do
  json.task do
    json.partial! 'v1/tasks/task', task: @task
  end
end
