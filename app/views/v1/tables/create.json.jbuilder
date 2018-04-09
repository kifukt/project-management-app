json.data do
  json.user do
    json.partial! 'v1/tables/table', table: @table
  end
end
