class ChangeColumntsToTabels < ActiveRecord::Migration
  def up
    change_column :clients, :period, :integer
  end

  def down
    change_column :clients, :period, :string
  end
end
