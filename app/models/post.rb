class Post < ApplicationRecord
  include CommentsOffsetable
  has_many :comments, as: :parent

  validates :content, presence: true
end
