class ChangeColumntNumberToOrders < ActiveRecord::Migration
  def up
    change_column :orders, :number, :string
  end

  def down
    change_column :orders, :number, :integer
  end
end
