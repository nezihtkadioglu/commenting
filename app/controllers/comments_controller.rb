class CommentsController < ApplicationController
  before_action :set_comments, only: [:index]
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_comments
      limit_id = params[:after_comment]
      number = params[:comment_number]
      @main_resource = if params[:post_id]
                        Post.find(params[:post_id])
                      elsif params[:comment_id]
                        Comment.find(params[:comment_id])
                      else
                        head :not_found
                      end
      @comments = @main_resource.offset_comments(limit_id: limit_id, number: number).includes(:comments)
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:parent_id, :parent_type, :content)
    end
end
