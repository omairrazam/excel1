class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :sheet_name
      t.string :x_colname
      t.string :y1_colname
      t.string :y2_colname
      t.references :adts, index: true, foreign_key: true
      t.references :graph, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
