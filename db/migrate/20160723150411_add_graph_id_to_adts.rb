class AddGraphIdToAdts < ActiveRecord::Migration
  def change
    add_column :adts, :graph_id, :integer
  end
end
