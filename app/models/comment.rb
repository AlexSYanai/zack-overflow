class Comment < ActiveRecord::Base
  has_many :votes, as: :votable

  belongs_to :post
  belongs_to :author, class: "User", foreign_key: 'user_id'

  # belongs_to :parent, class_name: "Comment", foreign_key: "parent_id"
  # has_many :children, class_name: "Comment"
end
