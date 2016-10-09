class RenameVotingFormToVotingForm < ActiveRecord::Migration[5.0]
  def change
    rename_table :single_votes, :voting_forms
  end
end
