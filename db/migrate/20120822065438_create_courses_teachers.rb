class CreateCoursesTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers do |t|
      t.integer :course_id
      t.integer :teacher_id
    end
  end
end
