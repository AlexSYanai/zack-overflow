module CategoryHelper
  def is_admin?
    User.role.downcase == 'admin' || 'administrator'
  end
end
