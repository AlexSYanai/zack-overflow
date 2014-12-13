class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
<<<<<<< HEAD
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to posts_path
    else
    flash.now[:error] = "Invalid login"
    render :new
=======
    @current_user = User.find_by(name: params[:session][:user_name])

    if @current_user && @current_user.authenticate(params[:session][:user_password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = "Invalid Login."
      redirect_to login_path
>>>>>>> ac9e3484b19faabd3b8276151a7b9642d7786e6f
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
