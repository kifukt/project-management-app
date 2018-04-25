json.data do
  json.list do
    json.partial! 'v1/lists/list', list: @list
  end
end
