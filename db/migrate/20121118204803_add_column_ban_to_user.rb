class AddColumnBanToUser < ActiveRecord::Migration
  def change
    add_column :users, :ban, :string
  end
end
