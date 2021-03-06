# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130206174755) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.integer  "status_id"
    t.integer  "resource_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "idvk"
    t.string   "school"
    t.string   "parent"
    t.string   "parent_phone"
    t.integer  "channel_id"
    t.integer  "manager_id"
    t.integer  "period"
    t.integer  "office_id"
    t.text     "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "surname"
    t.string   "author"
    t.string   "editor"
    t.string   "presumed_start"
    t.string   "course"
    t.string   "date"
    t.string   "middle_name"
    t.string   "day"
    t.string   "time"
  end

  add_index "clients", ["channel_id"], :name => "index_clients_on_channel_id"
  add_index "clients", ["manager_id"], :name => "index_clients_on_manager_id"
  add_index "clients", ["office_id"], :name => "index_clients_on_office_id"
  add_index "clients", ["resource_id"], :name => "index_clients_on_resource_id"
  add_index "clients", ["status_id"], :name => "index_clients_on_status_id"

  create_table "clients_courses", :force => true do |t|
    t.integer "client_id"
    t.integer "course_id"
  end

  create_table "costs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "direction"
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses_teachers", :force => true do |t|
    t.integer "course_id"
    t.integer "teacher_id"
  end

  create_table "mail_boxes", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "resource_id"
  end

  create_table "managers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "idvk"
    t.string   "school"
    t.integer  "percent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "salary"
  end

  create_table "msalaries", :force => true do |t|
    t.integer  "manager_id"
    t.string   "date"
    t.integer  "summ"
    t.string   "type"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "start"
    t.string   "end"
    t.string   "pay_from"
    t.string   "pay_to"
  end

  add_index "msalaries", ["manager_id"], :name => "index_msalaries_on_manager_id"

  create_table "objects_of_expenditures", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "client_id"
    t.string   "contract"
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.integer  "schedule_id"
    t.integer  "office_id"
    t.string   "start"
    t.string   "number"
    t.string   "end"
    t.string   "discount"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "date"
    t.string   "author"
    t.string   "editor"
  end

  add_index "orders", ["client_id"], :name => "index_orders_on_client_id"
  add_index "orders", ["course_id"], :name => "index_orders_on_course_id"
  add_index "orders", ["office_id"], :name => "index_orders_on_office_id"
  add_index "orders", ["schedule_id"], :name => "index_orders_on_schedule_id"
  add_index "orders", ["teacher_id"], :name => "index_orders_on_teacher_id"

  create_table "outlays", :force => true do |t|
    t.string   "date"
    t.integer  "summ"
    t.integer  "cost_id"
    t.string   "type"
    t.string   "person"
    t.string   "comment"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "objects_of_expenditure_id"
  end

  add_index "outlays", ["cost_id"], :name => "index_outlays_on_cost_id"

  create_table "payments", :force => true do |t|
    t.string   "date"
    t.integer  "summ"
    t.string   "type"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "start"
    t.date     "end"
    t.string   "pay_from"
    t.string   "pay_to"
    t.string   "office"
    t.string   "client"
    t.string   "schedule"
    t.integer  "hours"
    t.integer  "course_id"
    t.string   "order_name"
  end

  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"

  create_table "periods", :force => true do |t|
    t.integer  "period"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "salaries", :force => true do |t|
    t.string   "date"
    t.integer  "summ"
    t.integer  "course_id"
    t.string   "type"
    t.text     "comment"
    t.integer  "teacher_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "start"
    t.string   "end"
    t.integer  "schedule_id"
    t.string   "pay_from"
    t.string   "pay_to"
    t.integer  "hours"
  end

  add_index "salaries", ["course_id"], :name => "index_salaries_on_course_id"

  create_table "schedules", :force => true do |t|
    t.string   "day"
    t.string   "time"
    t.integer  "office_id"
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.integer  "hours"
    t.string   "start"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "end"
    t.text     "comment"
  end

  add_index "schedules", ["course_id"], :name => "index_schedules_on_course_id"
  add_index "schedules", ["office_id"], :name => "index_schedules_on_office_id"
  add_index "schedules", ["teacher_id"], :name => "index_schedules_on_teacher_id"

  create_table "sort_options", :force => true do |t|
    t.integer  "user_id"
    t.string   "channels"
    t.string   "clients"
    t.string   "costs"
    t.string   "courses"
    t.string   "managers"
    t.string   "msalaries"
    t.string   "offices"
    t.string   "orders"
    t.string   "outlays"
    t.string   "payments"
    t.string   "resources"
    t.string   "salaries"
    t.string   "schedules"
    t.string   "statuses"
    t.string   "teachers"
    t.string   "users"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "idvk"
    t.string   "workplace"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "surname"
    t.integer  "salary"
    t.integer  "percent"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "user_nick"
    t.string   "role"
    t.string   "ban"
    t.string   "name"
    t.string   "surname"
    t.string   "position"
    t.integer  "office_id"
    t.integer  "phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
