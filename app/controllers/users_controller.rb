class UsersController < ApplicationController
  before_action :not_logged_in_user, only: [:new, :create]
  
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.name} we hope you have fun"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
