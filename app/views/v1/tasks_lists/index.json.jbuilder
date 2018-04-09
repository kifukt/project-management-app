json.data do
  json.array! @tasks_lists do |tasks_list|
    json.partial! 'v1/tasks_lists/tasks_list', tasks_list: tasks_list
  end
end
