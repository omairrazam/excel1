class RemoveColsFromDatasets < ActiveRecord::Migration
  def change
  	remove_column :datasets, :open
  	remove_column :datasets, :close
  	remove_column :datasets, :high
  	remove_column :datasets, :low
  end
end
