class EditSalary < ActiveRecord::Migration
  def change
  	add_column :salaries, :start, :date
  	add_column :salaries, :end, :date
  	remove_column :salaries, :month
  end
end
