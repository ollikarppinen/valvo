class CreateVotingForms < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_forms do |t|
      t.references :vote, foreign_key: true

      t.timestamps
    end
  end
end