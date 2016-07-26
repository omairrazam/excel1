class RenameColumnAdtsIdToDatasets < ActiveRecord::Migration
  def change
  	rename_column :datasets, :adts_id, :adt_id
  end
end
