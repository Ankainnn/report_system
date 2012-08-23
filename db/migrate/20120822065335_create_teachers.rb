class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :idvk
      t.string :workplace
      t.text :comment

      t.timestamps
    end
  end
end
