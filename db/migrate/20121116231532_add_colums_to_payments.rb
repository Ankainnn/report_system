class AddColumsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :pay_from, :string
    add_column :payments, :pay_to, :string
    add_column :msalaries, :pay_from, :string
    add_column :msalaries, :pay_to, :string
    add_column :salaries, :pay_from, :string
    add_column :salaries, :pay_to, :string
  end
end
