class ChageColumnToOrder < ActiveRecord::Migration
  def up
    change_column :orders, :price, :integer
  end

  def down
    change_column :orders, :price, :float
  end
end
