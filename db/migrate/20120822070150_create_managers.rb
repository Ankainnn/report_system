class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :phone
      t.string :idvk
      t.string :school
      t.integer :percent

      t.timestamps
    end
  end
end
