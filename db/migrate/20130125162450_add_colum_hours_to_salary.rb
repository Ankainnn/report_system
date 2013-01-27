class AddColumHoursToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :hours, :integer
  end
end
