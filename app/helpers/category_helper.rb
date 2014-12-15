module CategoryHelper
  def is_admin?
<<<<<<< HEAD
    user = User.find(session[:user_id])
    if user.role != nil
      user.role.downcase == 'admin' || user.role.downcase == 'administrator'
    else
      redirect_to posts_path
    end
=======
    user = User.find(params[:user_id])
    user.role.downcase == 'admin' || user.role.downcase == 'administrator'
>>>>>>> 32f469079622d2a4d88b2c01586806425cc07cf0
  end
end
