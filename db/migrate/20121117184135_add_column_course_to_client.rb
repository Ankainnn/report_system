class AddColumnCourseToClient < ActiveRecord::Migration
  def change
    add_column :clients, :course, :string
  end
end