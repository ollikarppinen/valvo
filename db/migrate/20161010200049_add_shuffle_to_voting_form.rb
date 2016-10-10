class AddShuffleToVotingForm < ActiveRecord::Migration[5.0]
  def change
    add_column :voting_forms, :shuffle, :string, array: true
  end
end
