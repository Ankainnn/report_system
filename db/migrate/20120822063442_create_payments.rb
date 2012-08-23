class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :date
      t.float :summ
      t.string :type
      t.references :order

      t.timestamps
    end
    add_index :payments, :order_id
  end
end
