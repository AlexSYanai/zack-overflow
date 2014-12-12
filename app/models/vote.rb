class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  def downvote
    up_down_vote = false #for a particular instance
  end

  # def vote_count

  # end

  # def upvote
    # potentially add upvote function?
  # end

end