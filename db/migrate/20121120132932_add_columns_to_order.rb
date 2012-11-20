class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :author, :string
    add_column :orders, :editor, :string
  end
end
