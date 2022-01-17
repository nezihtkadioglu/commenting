require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/comments", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      parent_type: parent_type,
      parent_id: parent_id,
      content: Faker::Quotes::Shakespeare.hamlet_quote
    }
  end

  let(:invalid_attributes) do
    {
      parent_type: nil,
      parent_id: nil,
      content: nil
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response for posts/comments" do
      comment = create(:comment, :post_parent)
      get post_comments_url(comment.parent.id), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it "renders a successful response for comments/comments" do
      comment = create(:comment, :comment_parent)
      get comment_comments_url(comment.parent.id), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it "takes into account after_comment and comment_number"
  end

  describe "GET /show" do
    it "renders a successful response" do
      comment = create(:comment, :post_parent)
      get comment_url(comment), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters - Post parent" do
      let(:postit) { create(:post) }
      let(:parent_type) { 'Post' }
      let(:parent_id) { postit.id }
      it "creates a new Comment" do
        expect {
          post comments_url,
               params: { comment: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Comment, :count).by(1)
      end

      it "renders a JSON response with the new comment" do
        post comments_url,
             params: { comment: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with valid parameters - Comment parent" do
      let(:comment) { create(:comment, :comment_parent) }
      let(:parent_type) { 'Comment' }
      let(:parent_id) { comment.id }
      it "creates a new Comment" do
        expect {
          post comments_url,
               params: { comment: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Comment, :count).by(3)
      end

      it "renders a JSON response with the new comment" do
        post comments_url,
             params: { comment: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post comments_url,
               params: { comment: invalid_attributes }, as: :json
        }.to change(Comment, :count).by(0)
      end

      it "renders a JSON response with errors for the new comment" do
        post comments_url,
             params: { comment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let!(:content) { Faker::Quotes::Shakespeare.hamlet_quote }
      let!(:new_attributes) {
        { content: content}
      }

      it "updates the requested comment" do
        comment = create(:comment, :post_parent)
        patch comment_url(comment),
              params: { comment: new_attributes }, headers: valid_headers, as: :json
        comment.reload
        expect(comment.content).to eq(content)
      end

      it "renders a JSON response with the comment" do
        comment = create(:comment, :post_parent)
        patch comment_url(comment),
              params: { comment: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the comment" do
        comment = create(:comment, :post_parent)
        patch comment_url(comment),
              params: { comment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested comment" do
      comment = create(:comment, :post_parent)
      expect {
        delete comment_url(comment), headers: valid_headers, as: :json
      }.to change(Comment, :count).by(-1)
    end
  end
end
