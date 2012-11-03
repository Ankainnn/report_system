class ChangeColumnsInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :dayandtime, :number
  end
end
