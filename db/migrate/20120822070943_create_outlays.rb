class CreateOutlays < ActiveRecord::Migration
  def change
    create_table :outlays do |t|
      t.datetime :date
      t.float :summ
      t.string :name
      t.references :cost
      t.string :type
      t.string :person
      t.string :comment

      t.timestamps
    end
    add_index :outlays, :cost_id
  end
end
