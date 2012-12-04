class AddColumnsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :day, :string
    add_column :clients, :time, :string
    remove_column :clients, :daysandtime
    remove_column :clients, :subjects
  end
end
