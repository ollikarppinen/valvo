class AddStartAndEndUuidsToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :start_uuid, :uuid, default: 'uuid_generate_v4()'
    add_column :votes, :end_uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
