json.data do
  json.user do
    json.partial! 'v1/comments/comment', comment: @comment
  end
end
