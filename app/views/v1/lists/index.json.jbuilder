json.data do
  json.array! @lists do |list|
    json.partial! 'v1/lists/list', list: list
  end
end
