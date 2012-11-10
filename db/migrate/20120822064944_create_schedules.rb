class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :time
      t.references :office
      t.references :teacher
      t.references :course
      t.integer :hours
      t.datetime :start

      t.timestamps
    end
    add_index :schedules, :office_id
    add_index :schedules, :teacher_id
    add_index :schedules, :course_id
  end
end
