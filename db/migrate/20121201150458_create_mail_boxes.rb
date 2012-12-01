class CreateMailBoxes < ActiveRecord::Migration
  def change
    create_table :mail_boxes do |t|
      t.string :email
      t.string :password
      t.string :resource

      t.timestamps
    end
  end
end
