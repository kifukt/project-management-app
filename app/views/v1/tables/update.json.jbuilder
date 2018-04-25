json.data do
  json.table do
    json.partial! 'v1/tables/table', table: @table
  end
end
