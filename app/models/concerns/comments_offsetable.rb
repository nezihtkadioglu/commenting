module CommentsOffsetable
  extend ActiveSupport::Concern

  included do
    def offset_comments(limit_id: 0, number: 10)
      limit_id ||= 0
      number_id ||= 0
      comments.limit(number).where('id > ?', limit_id&.to_i)
    end
  end
end