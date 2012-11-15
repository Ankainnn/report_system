class AddUserNickToClient < ActiveRecord::Migration
  def change
    add_column :clients, :login, :string
  end
end
