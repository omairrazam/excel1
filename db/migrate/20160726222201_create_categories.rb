class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :sheetname

      t.timestamps null: false
    end
  end
end