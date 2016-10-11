class AddCandidateNumberToVotingDecision < ActiveRecord::Migration[5.0]
  def change
    add_column :voting_decisions, :candidate_number, :integer
  end
end
