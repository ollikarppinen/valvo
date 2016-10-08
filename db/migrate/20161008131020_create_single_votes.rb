class CreateSingleVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :single_votes do |t|
      t.references :vote, foreign_key: true

      t.timestamps
    end
  end
end
