class RemoveColumnNameToOutlay < ActiveRecord::Migration
  def up
    remove_column :outlays, :name
  end

  def down
    add_column :outlays, :name
  end
end
