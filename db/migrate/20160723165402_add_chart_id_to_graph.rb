class AddChartIdToGraph < ActiveRecord::Migration
  def change
    add_column :graphs, :chart_id, :integer
  end
end
