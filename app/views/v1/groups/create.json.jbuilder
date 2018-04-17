json.data do
  json.user do
    json.partial! 'v1/groups/group', group: @group
  end
end
