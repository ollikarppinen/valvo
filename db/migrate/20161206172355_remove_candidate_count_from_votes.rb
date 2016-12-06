class RemoveCandidateCountFromVotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :candidate_count, :integer
  end
end
