class AddVotingFormCountToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :voting_form_count, :integer
  end
end
