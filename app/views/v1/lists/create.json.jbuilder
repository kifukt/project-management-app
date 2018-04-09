json.data do
  json.user do
    json.partial! 'v1/lists/list', list: @list
  end
end
