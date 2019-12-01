class LikesController < ApplicationController
  before_action :find_comment

  def create
    @comment.likes.create(author_id: current_author.id)
    redirect_to comment_path(@comment)
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end
end
