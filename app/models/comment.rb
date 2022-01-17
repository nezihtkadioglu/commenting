class Comment < ApplicationRecord
  include CommentsOffsetable
  default_scope { order(created_at: :asc) }

  belongs_to :parent, polymorphic: true
  has_many :comments, as: :parent

  validates :content, presence: true

  def next_two_comments
    comments.limit(2)
  end
end
