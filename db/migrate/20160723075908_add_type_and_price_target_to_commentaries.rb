class AddTypeAndPriceTargetToCommentaries < ActiveRecord::Migration
  def change
    add_column :commentaries, :typee, :string
    remove_column :commentaries, :type
    add_column :commentaries, :priceTarget, :string
  end
end
