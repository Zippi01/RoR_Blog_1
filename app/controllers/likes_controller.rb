class LikesController < ApplicationController
  before_action :find_comment

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @comment.likes.create(author_id: current_author.id)
    end
    redirect_to @post
  end

  def destroy
    @like = @comment.likes.find(params[:id])
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
  end



  def already_liked?
    Like.where(author_id: current_author.id, comment_id:
        params[:comment_id]).exists?
  end
end
