class PassResetController < ApplicationController
  before_action :find_author, only: %i[edit update]

  def new; end

  def create
    author = Author.find_by_email(params[:email])
    author.password_reset if author
    flash[:success] = "Email sent with password reset instructions."
    redirect_to '/posts'
  end

  def edit; end

  def update
    if @author.pass_time < 1.hour.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired."
    elsif @author.update_attributes(params.require(:author).permit(:password, :password_confirmation))
      redirect_to '/posts'
      flash[:success] = "Password has been reset!"
    else
      render :edit
    end
  end

  private

  def find_author
    @author = Author.find_by_confirm_token!(params[:id])
  end
end
