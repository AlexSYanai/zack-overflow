class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :posts, foreign_key: :creator
  has_many :comments, foreign_key: :creator
  has_many :votes

  def may_edit(item)
    self.is_admin || item.user.id == self.id
  end
end

