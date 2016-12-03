class AddTitleToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :title, :string
  end
end
