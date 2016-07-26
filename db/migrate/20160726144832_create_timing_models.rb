class CreateTimingModels < ActiveRecord::Migration
  def change
    create_table :timing_models do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
