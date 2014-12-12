class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up_down_vote, default: true
      t.references :user

      t.integer :votable_id
      t.string :votable_type

      t.timestamps
    end
  end
end
