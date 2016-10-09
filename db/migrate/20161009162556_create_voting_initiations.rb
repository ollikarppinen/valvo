class CreateVotingInitiations < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_initiations do |t|
      t.references :vote, foreign_key: true

      t.timestamps
    end
  end
end
