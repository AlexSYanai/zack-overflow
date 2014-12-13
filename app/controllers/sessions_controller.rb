class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @current_user = User.find_by(name: params[:session][:user_name])

    if @current_user && @current_user.authenticate(params[:session][:user_password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = "Invalid Login."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
