class CreateObjectsOfExpenditures < ActiveRecord::Migration
  def change
    create_table :objects_of_expenditures do |t|
      t.text :name

      t.timestamps
    end
    add_column :outlays, :objects_of_expenditure_id, :integer

  end
end
