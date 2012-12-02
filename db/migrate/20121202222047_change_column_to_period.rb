class ChangeColumnToPeriod < ActiveRecord::Migration
  def up
    change_column :periods, :period, :integer
  end

  def down
    change_column :periods, :period, :string
  end
end
