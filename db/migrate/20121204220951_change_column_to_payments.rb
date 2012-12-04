class ChangeColumnToPayments < ActiveRecord::Migration
  def up
    change_column :payments, :summ, :integer
  end

  def down
    change_column :payments, :summ, :float
  end
end
