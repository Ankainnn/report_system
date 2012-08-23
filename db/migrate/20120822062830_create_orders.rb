class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client
      t.datetime :contract
      t.references :course
      t.references :teacher
      t.references :schedule
      t.references :office
      t.datetime :start
      t.string :dayandtime
      t.string :end
      t.string :discount
      t.float :price

      t.timestamps
    end
    add_index :orders, :client_id
    add_index :orders, :course_id
    add_index :orders, :teacher_id
    add_index :orders, :schedule_id
    add_index :orders, :office_id
  end
end
