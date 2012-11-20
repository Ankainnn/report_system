class AddColumnMiddleNameToClient < ActiveRecord::Migration
  def change
    add_column :clients, :middle_name, :string
  end
end
