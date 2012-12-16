class AddColumnToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :order_name, :string
  end
end
