class AddColumnSubjectsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :subjects, :text
  end
end
