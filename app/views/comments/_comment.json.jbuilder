json.partial! 'comments/base_comment', comment: comment

json.next_two_comments comment.next_two_comments, partial: 'comments/base_comment', as: :comment

