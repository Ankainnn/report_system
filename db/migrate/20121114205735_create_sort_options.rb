class CreateSortOptions < ActiveRecord::Migration
  def change
    create_table :sort_options do |t|
      t.integer :user_id
      t.string :channels
      t.string :clients
      t.string :costs
      t.string :courses
      t.string :managers
      t.string :msalaries
      t.string :offices
      t.string :orders
      t.string :outlays
      t.string :payments
      t.string :resources
      t.string :salaries
      t.string :schedules
      t.string :statuses
      t.string :teachers
      t.string :users

      t.timestamps
    end
  end
end
