class AddChartIdToAdt < ActiveRecord::Migration
  def change
    add_column :adts, :chart_id, :integer
  end
end
