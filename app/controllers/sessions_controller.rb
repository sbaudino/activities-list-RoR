class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html # default
      format.js # modal
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      @lists = user.lists
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You are now logged out'
    redirect_to root_path
  end
end
