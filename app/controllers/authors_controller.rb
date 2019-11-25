class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to '/posts'
      flash[:info] = "Welcome, #{@author.first_name} #{@author.last_name}!"
    else
      render 'new'
    end
  end


  private

  def author_params
    params.require(:author).permit(:email, :password, :first_name, :last_name)
  end
end
