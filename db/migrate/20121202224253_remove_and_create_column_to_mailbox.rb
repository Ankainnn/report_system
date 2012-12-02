class RemoveAndCreateColumnToMailbox < ActiveRecord::Migration
  def up
    remove_column :mail_boxes, :resource
    add_column :mail_boxes, :resource_id, :integer
  end

  def down
  end
end
