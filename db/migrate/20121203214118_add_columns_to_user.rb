class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :position, :string
    add_column :users, :office_id, :integer
    add_column :users, :phone, :integer
  end
end
