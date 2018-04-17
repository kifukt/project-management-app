json.data do
  json.group do
    json.partial! 'v1/groups/show', group: @group
  end
end
