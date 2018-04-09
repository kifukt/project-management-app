json.data do
  json.user do
    json.partial! 'v1/tasks/task', task: @task
  end
end
