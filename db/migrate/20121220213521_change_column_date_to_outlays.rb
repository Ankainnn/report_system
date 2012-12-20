class ChangeColumnDateToOutlays < ActiveRecord::Migration
  def up
    change_column :outlays, :date, :string
    change_column :msalaries, :date, :string
    change_column :payments, :date, :string
  end

  def down
    change_column :outlays, :date, :date
    change_column :msalaries, :date, :date
    change_column :payments, :date, :date
  end
end
