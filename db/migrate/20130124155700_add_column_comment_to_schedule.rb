class AddColumnCommentToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :comment, :text
  end
end
