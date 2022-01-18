require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post) { create(:post) }
  describe 'has a functioning factory' do
    it 'is valid' do
      expect(post.valid?).to eq(true)
    end
    it 'has content' do
      expect(post.content).to_not eq(nil)
    end
    it 'has at least a comment' do
      expect(post.comments.count.zero?).to_not be_falsey
    end
  end
end
