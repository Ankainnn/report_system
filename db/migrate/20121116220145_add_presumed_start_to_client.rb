class AddPresumedStartToClient < ActiveRecord::Migration
  def change
    add_column :clients, :presumed_start, :string
  end
end
