class AddFioToUser < ActiveRecord::Migration
  def change
  	add_column :clients, :surname, :string
  end
end
