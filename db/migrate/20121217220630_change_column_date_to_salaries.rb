class ChangeColumnDateToSalaries < ActiveRecord::Migration
  def up
    change_column :salaries, :date, :string
  end

  def down
  end
end
