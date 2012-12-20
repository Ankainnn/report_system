class ChangeColumnToOrders < ActiveRecord::Migration
  def up
    change_column :orders, :number, :integer
  end

  def down
    change_column :orders, :number, :string
  end
end
