class AddStartEndToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :end, :date
    change_column :schedules, :start, :date
  end
end
