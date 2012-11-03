class AddFieldsToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :author, :string
  	add_column :clients, :editor, :string
  end
end
