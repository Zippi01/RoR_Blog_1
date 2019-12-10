class CommentsController < ApplicationController
  before_action :find_post
  impressionist actions: [:show], unique: [:session_hash]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.author_id = current_author.id
    if @comment.ancestors.count <= 4
      respond_to do |format|
        if @comment.save
          format.js {render 'create', status: :created, location: @post}
          format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: 'To much comments in one tree (5 comments max)' }
      end
    end
  end

  def index
    @post.comments = @post.comments.arrange(order: :created_at)
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def edit
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
    end

   def update
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
     respond_to do |format|
       if @comment.update(comment_params)
         format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
         format.json { render :show, status: :ok, location: @post }
       else
         format.html { render :edit }
         format.json { render json: @post.errors, status: :unprocessable_entity }
       end
     end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if (current_author.id == @comment.author_id)
          @comment.destroy
          respond_to do |format|
            format.js {render 'destroy', status: :created, location: @post}
            format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
          end
        else
          redirect_to root_path
        end
      end

  private

  def comment_params
     params.require(:comment).permit(:body, :author_id, :parent_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def actions_check
    if cookies[:actions]
      cookies[:actions] = cookies[:actions].to_i + 1
    else
      cookies[:actions] = 0
    end
  end
end
