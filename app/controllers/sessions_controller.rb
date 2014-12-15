class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(username: params[:session][:user_name])

    if user && user.authenticate(params[:session][:user_password])
      login(user)
      redirect_to posts_path
    else
      flash[:error] = "Invalid login"
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
