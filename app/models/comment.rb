class Comment < ActiveRecord::Base
  has_many :votes, as: :votable

  belongs_to :post
  belongs_to :author, class: "User", foreign_key: 'user_id'

  def total_points
    self.votes.pluck(:value).reduce(:+)
  end
end
