class AddColumsDate < ActiveRecord::Migration
  def up
    add_column :clients, :date, :string
    add_column :orders, :date, :string
  end

  def down
  end
end
