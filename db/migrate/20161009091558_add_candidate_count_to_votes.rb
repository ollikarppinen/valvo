class AddCandidateCountToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :candidate_count, :integer
  end
end
