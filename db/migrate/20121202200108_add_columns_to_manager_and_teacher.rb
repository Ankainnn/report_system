class AddColumnsToManagerAndTeacher < ActiveRecord::Migration
  def change
    add_column :managers, :salary, :integer
    add_column :teachers, :salary, :integer
    add_column :teachers, :percent, :integer
  end
end
