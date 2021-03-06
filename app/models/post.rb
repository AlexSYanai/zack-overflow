class Post < ActiveRecord::Base
  validates  :title, presence: true, uniqueness: true
  validates  :content, presence: true

  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_many :comments, :dependent => :destroy
  has_many :votes, as: :votable

  def total_points
    self.votes.pluck(:value).reduce(:+) || 0
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
