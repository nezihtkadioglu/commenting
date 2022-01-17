json.(comment, :id, :created_at, :updated_at, :content)

json.parent do
  json.id
  json.url url_for(comment.parent)
end
