json.data do
  json.array! @comments do |comment|
    json.partial! 'v1/comments/comment', comment: comment
  end
end
