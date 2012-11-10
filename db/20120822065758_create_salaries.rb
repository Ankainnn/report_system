class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.datetime :date
      t.float :summ
      t.references :course
      t.string :month
      t.string :type
      t.text :comment
      t.references :teacher

      t.timestamps
    end
    add_index :salaries, :course_id
  end
end
