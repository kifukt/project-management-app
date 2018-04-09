json.data do
  json.array! @tables do |table|
    json.partial! 'v1/tables/table', table: table
  end
end
