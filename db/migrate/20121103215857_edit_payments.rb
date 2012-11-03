class EditPayments < ActiveRecord::Migration
  def change
  	add_column :payments, :start, :date
  	add_column :payments, :end, :date
  end
end
