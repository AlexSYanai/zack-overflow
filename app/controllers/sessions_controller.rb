class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to posts_path
    else
      flash.now[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
