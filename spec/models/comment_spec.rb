require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { create(:comment, :post_parent) }
  describe 'has a functioning factory' do
    it 'is valid' do
      expect(comment.valid?).to eq(true)
    end
    it 'has content' do
      expect(comment.content).to_not eq(nil)
    end
    context 'polymorphic parent' do
      it "can have a Post parent" do
        expect(comment.parent).to be_a(Post)
      end

      let(:comment_comment) { create(:comment, :comment_parent) }
      it "can have a Comment parent" do
        expect(comment_comment.parent).to be_a(Comment)
      end
    end
  end
end
