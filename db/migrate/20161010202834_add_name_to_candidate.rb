class AddNameToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :name, :string
  end
end
