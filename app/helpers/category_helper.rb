module CategoryHelper
  def is_admin?
    user = User.find(params[:user_id])
    user.role.downcase == 'admin' || user.role.downcase == 'administrator'
  end
end
