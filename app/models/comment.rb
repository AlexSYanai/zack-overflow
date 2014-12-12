class Comment < ActiveRecord::Base
  has_many :votes, as: :votable

  belongs_to :post
  belongs_to :creator, class: "User" #source potentially

  # belongs_to :parent, class_name: "Comment", foreign_key: "parent_id"
  # has_many :children, class_name: "Comment"
end