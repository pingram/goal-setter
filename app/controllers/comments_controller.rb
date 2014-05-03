class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to @comment.commentable
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to @comment.commentable
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:author_id, :body, :commentable_id, :commentable_type)
  end
end
