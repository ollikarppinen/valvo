class CreateVotingDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_decisions, id: :uuid do |t|
      t.references :voting_form, foreign_key: true, type: :uuid
      t.references :candidate, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
