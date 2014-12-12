class Post < ActiveRecord::Base
  validates  :title, presence: true, uniqueness: true
  validates  :content, presence: true, uniqueness: true
  belongs_to :creator, class_name: "User" #source potentially
  belongs_to :category
  has_many   :comments, :dependent => :destroy
  has_many   :votes, as: :votable
end
