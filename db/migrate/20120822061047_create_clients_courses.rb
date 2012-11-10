class CreateClientsCourses < ActiveRecord::Migration
  def change
    create_table :clients_courses do |t|
      t.integer :client_id
      t.integer :course_id
    end
  end
end
