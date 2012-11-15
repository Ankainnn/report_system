class AddUserNickToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_nick, :string
  end
end
