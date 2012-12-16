class ChangeColumnCourse < ActiveRecord::Migration
  def up
    remove_column :payments, :course
    add_column :payments, :course_id, :integer
  end

  def down
    remove_column :payments, :course_id
    add_column :payments, :course, :string
  end
end
