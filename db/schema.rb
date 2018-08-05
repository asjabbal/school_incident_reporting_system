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

ActiveRecord::Schema.define(version: 2018_08_03_124330) do

  create_table "incident_files", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "incident_id"
    t.string "document_file_name"
    t.string "document_content_type"
    t.bigint "document_file_size"
    t.datetime "document_updated_at"
    t.index ["incident_id"], name: "index_incident_files_on_incident_id"
  end

  create_table "incident_kinds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "incident_id"
    t.integer "kind"
    t.index ["incident_id"], name: "index_incident_kinds_on_incident_id"
  end

  create_table "incident_locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "incident_id"
    t.integer "location"
    t.string "other_location"
    t.index ["incident_id"], name: "index_incident_locations_on_incident_id"
  end

  create_table "incidents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "suspect_info"
    t.text "witness_info"
    t.datetime "occurred_at"
    t.text "description"
  end

  create_table "user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "incident_id"
    t.string "name"
    t.string "contact_info"
    t.integer "role"
    t.index ["incident_id"], name: "index_user_details_on_incident_id"
  end

  add_foreign_key "incident_files", "incidents"
  add_foreign_key "incident_kinds", "incidents"
  add_foreign_key "incident_locations", "incidents"
  add_foreign_key "user_details", "incidents"
end
