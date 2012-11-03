class EditMsalary < ActiveRecord::Migration
  def change
  	add_column :msalaries, :start, :date
  	add_column :msalaries, :end, :date
  	remove_column :msalaries, :month
  end
end
