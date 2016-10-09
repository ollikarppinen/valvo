class RenameVotingFormToVotingForm < ActiveRecord::Migration[5.0]
  def change
    rename_table :single_vote, :voting_forms
  end
end
