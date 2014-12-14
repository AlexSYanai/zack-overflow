class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :votable, polymorphic: true

  validates_uniqueness_of :user_id, :scope => :votable_id

end
