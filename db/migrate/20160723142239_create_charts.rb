class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :sheetname
      t.string :x_col_name
      t.string :y1_col_name
      t.string :y2_col_name

      t.timestamps null: false
      t.belongs_to :category
    end
  end
end
