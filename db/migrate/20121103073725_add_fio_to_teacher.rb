class AddFioToTeacher < ActiveRecord::Migration
  def change
  	add_column :teachers, :surname, :string
  end
end
