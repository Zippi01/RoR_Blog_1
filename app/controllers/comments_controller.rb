class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.author_id = current_author.id
    redirect_to post_path(@post)
    if @comment.save!
      flash.now[:danger] = "error"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
