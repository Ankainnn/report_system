class ChangeColumnToOutlays < ActiveRecord::Migration
  def up
    change_column :outlays, :summ, :integer
  end

  def down
    change_column :outlays, :summ, :float
  end
end
