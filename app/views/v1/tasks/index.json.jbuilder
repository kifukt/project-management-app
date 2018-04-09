json.data do
  json.array! @tasks do |task|
    json.partial! 'v1/tasks/task', task: task
  end
end
