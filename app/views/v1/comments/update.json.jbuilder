json.data do
  json.comment do
    json.partial! 'v1/comments/comment', comment: @comment
  end
end
