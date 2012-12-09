class ChangeComunsToOrderAndSalary < ActiveRecord::Migration
  def up
    change_column :orders, :start, :string
    change_column :orders, :end, :string
    change_column :orders, :contract, :string
    change_column :salaries, :start, :string
    change_column :salaries, :end, :string
  end

  def down
  end
end
