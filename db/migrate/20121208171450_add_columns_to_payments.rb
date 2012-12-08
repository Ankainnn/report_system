class AddColumnsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :office, :string
    add_column :payments, :client, :string
    add_column :payments, :schedule, :string
    add_column :payments, :hours, :integer
    add_column :payments, :course, :string
  end
end
