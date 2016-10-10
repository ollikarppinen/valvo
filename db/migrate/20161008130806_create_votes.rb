class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
    create_table :votes, id: :uuid do |t|
      t.integer :voting_form_count
      t.integer :candidate_count

      t.timestamps
    end
  end
end
