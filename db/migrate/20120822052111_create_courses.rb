class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :direction
      t.string :subject

      t.timestamps
    end
  end
end
