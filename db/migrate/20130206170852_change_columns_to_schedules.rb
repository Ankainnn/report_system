class ChangeColumnsToSchedules < ActiveRecord::Migration
  def up
    change_column :schedules, :start, :string
    change_column :schedules, :end, :string
  end

  def down
    change_column :schedules, :start, :date
    change_column :schedules, :end, :date
  end
end
