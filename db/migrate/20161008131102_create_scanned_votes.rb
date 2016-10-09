class CreateScannedVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :scanned_votes do |t|
      t.references :voting_form, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
