class RemoveUserNickToClients < ActiveRecord::Migration
  def up
    remove_column :clients, :login
  end

  def down
  end
end
