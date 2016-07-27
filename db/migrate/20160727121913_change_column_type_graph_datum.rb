class ChangeColumnTypeGraphDatum < ActiveRecord::Migration
  def change
  	change_column :graph_data, :y1_values,  :integer
  	change_column :graph_data, :y2_values,  :integer
  end
end
