class RemoveColsManual < ActiveRecord::Migration
  def change
  	remove_column :graphs , :chart_id
  	remove_column :adts , :chart_id
  end
end
