class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :status
      t.references :resource
      t.string :name
      t.string :phone
      t.string :email
      t.string :idvk
      t.string :school
      t.string :parent
      t.string :parent_phone
      t.references :channel
      t.references :manager
      t.string :daysandtime
      t.string :period
      t.references :office
      t.text :comment

      t.timestamps
    end
    add_index :clients, :status_id
    add_index :clients, :resource_id
    add_index :clients, :channel_id
    add_index :clients, :manager_id
    add_index :clients, :office_id
  end
end
