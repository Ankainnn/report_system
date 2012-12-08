class ChangeColumns < ActiveRecord::Migration
  def up
    change_column :salaries, :summ, :integer
    change_column :msalaries, :summ, :integer
  end

  def down
    change_column :salaries, :summ, :float
    change_column :msalaries, :summ, :float
  end
end
