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

ActiveRecord::Schema.define(:version => 20121103215857) do

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
    t.string   "daysandtime"
    t.string   "period"
    t.integer  "office_id"
    t.text     "comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "surname"
    t.string   "author"
    t.string   "editor"
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

  create_table "managers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "idvk"
    t.string   "school"
    t.integer  "percent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "msalaries", :force => true do |t|
    t.integer  "manager_id"
    t.datetime "date"
    t.float    "summ"
    t.string   "type"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "start"
    t.date     "end"
  end

  add_index "msalaries", ["manager_id"], :name => "index_msalaries_on_manager_id"

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "client_id"
    t.date     "contract"
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.integer  "schedule_id"
    t.integer  "office_id"
    t.date     "start"
    t.string   "number"
    t.date     "end"
    t.string   "discount"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "orders", ["client_id"], :name => "index_orders_on_client_id"
  add_index "orders", ["course_id"], :name => "index_orders_on_course_id"
  add_index "orders", ["office_id"], :name => "index_orders_on_office_id"
  add_index "orders", ["schedule_id"], :name => "index_orders_on_schedule_id"
  add_index "orders", ["teacher_id"], :name => "index_orders_on_teacher_id"

  create_table "outlays", :force => true do |t|
    t.datetime "date"
    t.float    "summ"
    t.string   "name"
    t.integer  "cost_id"
    t.string   "type"
    t.string   "person"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "outlays", ["cost_id"], :name => "index_outlays_on_cost_id"

  create_table "payments", :force => true do |t|
    t.datetime "date"
    t.float    "summ"
    t.string   "type"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "start"
    t.date     "end"
  end

  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "salaries", :force => true do |t|
    t.datetime "date"
    t.float    "summ"
    t.integer  "course_id"
    t.string   "type"
    t.text     "comment"
    t.integer  "teacher_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "start"
    t.date     "end"
    t.integer  "schedule_id"
  end

  create_table "schedules", :force => true do |t|
    t.string   "day"
    t.string   "time"
    t.integer  "office_id"
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.integer  "hours"
    t.datetime "start"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["course_id"], :name => "index_schedules_on_course_id"
  add_index "schedules", ["office_id"], :name => "index_schedules_on_office_id"
  add_index "schedules", ["teacher_id"], :name => "index_schedules_on_teacher_id"

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
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.integer  "active",                 :default => 0,  :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
