class AddPrivacyToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :private, :boolean, default: false
  end
end
