class ChangeColumsToMsalaries < ActiveRecord::Migration
  def up
    change_column :msalaries, :start, :string
    change_column :msalaries, :end, :string
  end

  def down
    change_column :msalaries, :start, :date
    change_column :msalaries, :end, :date
  end
end
