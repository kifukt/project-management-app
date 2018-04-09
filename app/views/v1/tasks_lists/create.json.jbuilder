json.data do
  json.user do
    json.partial! 'v1/tasks_lists/tasks_list', tasks_list: @tasks_list
  end
end
