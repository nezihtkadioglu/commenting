json.comments do
  json.array! @comments, partial: 'comments/comment', as: :comment
end
if @comments.any?
  json.next_ten_url polymorphic_url(@main_resource) + "/comments?after_comment=#{@comments.last.id}&comment_number=10"
end
