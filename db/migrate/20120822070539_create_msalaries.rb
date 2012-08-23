class CreateMsalaries < ActiveRecord::Migration
  def change
    create_table :msalaries do |t|
      t.references :manager
      t.datetime :date
      t.float :summ
      t.string :month
      t.string :type
      t.text :comment

      t.timestamps
    end
    add_index :msalaries, :manager_id
  end
end
