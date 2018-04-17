json.call(
  group,
  :id,
  :name
)
json.members group.users do |user|
  json.call(
    user,
    :id,
    :email
  )
end
json.leader do
  json.call(
    group.users.find(group.leader_id),
    :id,
    :email
  )
end
