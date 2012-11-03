class ChangeColumnsOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :start, :date
  	change_column :orders, :end, :date
  	change_column :orders, :contract, :date
  end
end
