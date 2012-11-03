class AddScheduleToSalary < ActiveRecord::Migration
  def change
  	add_column :salaries, :schedule_id, :integer
  end
end
