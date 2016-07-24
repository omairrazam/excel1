class AddImagesToIntrested < ActiveRecord::Migration
  def change
    add_column :interesteds, :image, :string
  end
end
