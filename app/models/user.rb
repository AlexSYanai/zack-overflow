class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :posts
  has_many :comments
  has_many :votes

  def may_edit(item)
    self.is_admin || item.user.id == self.id
  end

  def total_points
    total = []
    total << Post.where(author: self)
    total << Comment.where(author: self)
    total.flatten.map(&:total_points).reduce(:+) || 0
  end
end
