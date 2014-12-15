module CategoryHelper
  def is_admin?
    user = User.find(session[:user_id])
    if user.role != nil
      user.role.downcase == 'admin' || user.role.downcase == 'administrator'
    else
      redirect_to posts_path
    end
  end
end
