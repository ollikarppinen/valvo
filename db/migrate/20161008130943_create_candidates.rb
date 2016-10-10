class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates, id: :uuid do |t|
      t.references :vote, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
