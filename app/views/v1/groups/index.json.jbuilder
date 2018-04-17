json.data do
  json.array! @groups do |group|
    json.partial! 'v1/groups/group', group: group
  end
end
