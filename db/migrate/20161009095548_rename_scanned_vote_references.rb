class RenameScannedVoteReferences < ActiveRecord::Migration[5.0]
  def change
    rename_column :scanned_votes, :single_vote_id, :voting_form_id
  end
end
