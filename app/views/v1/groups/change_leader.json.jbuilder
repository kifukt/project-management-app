json.data do
  json.group do
    json.partial! 'v1/groups/group', group: @group
  end
end
