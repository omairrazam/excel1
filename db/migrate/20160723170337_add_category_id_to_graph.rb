class AddCategoryIdToGraph < ActiveRecord::Migration
  def change
    add_column :graphs, :category_id, :integer
  end
end
