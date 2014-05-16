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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140516022119) do

  create_table "asset_managers", force: true do |t|
    t.float    "version"
    t.string   "asset_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.integer  "sub_id0"
    t.integer  "sub_id1"
    t.integer  "sub_id2"
    t.integer  "sub_id3"
    t.integer  "sub_id4"
    t.integer  "pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["pool_id"], name: "pool_id", using: :btree

  create_table "cpu_confs", force: true do |t|
    t.string  "name",              null: false
    t.integer "max_temp",          null: false
    t.integer "max_gpu",           null: false
    t.boolean "run_only_inactive", null: false
  end

  create_table "cpu_miners", force: true do |t|
    t.integer  "pc_cpu_type_id",       null: false
    t.integer  "pool_id",              null: false
    t.datetime "start_datetime",       null: false
    t.datetime "end_datetime",         null: false
    t.integer  "total_time",           null: false
    t.integer  "shares",               null: false
    t.text     "log"
    t.integer  "update_interval_mins"
    t.integer  "hashrate",             null: false
  end

  add_index "cpu_miners", ["pc_cpu_type_id", "pool_id"], name: "pc_cpu_type_id", unique: true, using: :btree
  add_index "cpu_miners", ["pool_id"], name: "pool_id", using: :btree

  create_table "cpu_types", force: true do |t|
    t.string  "processor",   null: false
    t.integer "core_amount", null: false
    t.integer "cpu_conf_id", null: false
  end

  add_index "cpu_types", ["cpu_conf_id"], name: "cpu_conf_id", using: :btree
  add_index "cpu_types", ["processor"], name: "processor", unique: true, using: :btree

  create_table "gpu_confs", force: true do |t|
    t.string  "name",              null: false
    t.integer "max_temp",          null: false
    t.integer "max_cpu",           null: false
    t.boolean "run_only_inactive", null: false
  end

  create_table "gpu_miners", force: true do |t|
    t.integer  "pc_gpu_type_id",       null: false
    t.integer  "pool_id",              null: false
    t.datetime "start_datetime",       null: false
    t.datetime "end_datetime",         null: false
    t.integer  "total_time",           null: false
    t.integer  "shares",               null: false
    t.text     "log"
    t.integer  "update_interval_mins"
    t.integer  "hashrate",             null: false
  end

  add_index "gpu_miners", ["pc_gpu_type_id", "pool_id"], name: "pc_gpu_type_id", unique: true, using: :btree
  add_index "gpu_miners", ["pool_id"], name: "pool_id", using: :btree

  create_table "gpu_types", force: true do |t|
    t.string  "name",        null: false
    t.integer "core_amount", null: false
    t.integer "gpu_conf_id", null: false
  end

  add_index "gpu_types", ["gpu_conf_id"], name: "gpu_conf_id", using: :btree
  add_index "gpu_types", ["name"], name: "name", unique: true, using: :btree

  create_table "pc_cpu_types", force: true do |t|
    t.integer "pc_id",       null: false
    t.integer "cpu_type_id", null: false
  end

  add_index "pc_cpu_types", ["cpu_type_id"], name: "cpu_type_id", using: :btree
  add_index "pc_cpu_types", ["pc_id", "cpu_type_id"], name: "pc_id", unique: true, using: :btree

  create_table "pc_gpu_types", force: true do |t|
    t.integer "pc_id",       null: false
    t.integer "gpu_type_id", null: false
  end

  add_index "pc_gpu_types", ["gpu_type_id"], name: "gpu_type_id", using: :btree
  add_index "pc_gpu_types", ["pc_id", "gpu_type_id"], name: "pc_id", unique: true, using: :btree

  create_table "pcs", force: true do |t|
    t.string  "mac",           limit: 20, null: false
    t.string  "os_ver",                   null: false
    t.string  "computer_name",            null: false
    t.string  "system_type",              null: false
    t.integer "ram_size",                 null: false
    t.string  "ip_address",    limit: 18, null: false
    t.boolean "is_laptop"
    t.integer "sub_id0"
    t.integer "sub_id1"
    t.integer "sub_id2"
    t.integer "sub_id3"
    t.integer "sub_id4"
  end

  add_index "pcs", ["mac"], name: "mac", unique: true, using: :btree

  create_table "pool_types", force: true do |t|
    t.string "name", null: false
    t.string "algo", null: false
  end

  add_index "pool_types", ["name"], name: "name", unique: true, using: :btree

  create_table "pools", force: true do |t|
    t.string  "hostname",     null: false
    t.integer "port",         null: false
    t.string  "username",     null: false
    t.string  "password",     null: false
    t.integer "pool_type_id", null: false
  end

  add_index "pools", ["pool_type_id"], name: "pool_type_id", using: :btree

  create_table "uninstall_wise_managers", force: true do |t|
    t.integer  "pc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
