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

ActiveRecord::Schema.define(version: 20161203123442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "candidates", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "vote_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["vote_id"], name: "index_candidates_on_vote_id", using: :btree
  end

  create_table "votes", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "voting_form_count"
    t.integer  "candidate_count"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.uuid     "start_uuid",        default: -> { "uuid_generate_v4()" }
    t.uuid     "end_uuid",          default: -> { "uuid_generate_v4()" }
    t.string   "title"
  end

  create_table "voting_decisions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "voting_form_id"
    t.uuid     "candidate_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "candidate_number"
    t.index ["candidate_id"], name: "index_voting_decisions_on_candidate_id", using: :btree
    t.index ["voting_form_id"], name: "index_voting_decisions_on_voting_form_id", using: :btree
  end

  create_table "voting_ends", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_id"], name: "index_voting_ends_on_vote_id", using: :btree
  end

  create_table "voting_forms", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "vote_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "shuffle",                 array: true
    t.index ["vote_id"], name: "index_voting_forms_on_vote_id", using: :btree
  end

  create_table "voting_receipts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "voting_form_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["voting_form_id"], name: "index_voting_receipts_on_voting_form_id", using: :btree
  end

  create_table "voting_starts", force: :cascade do |t|
    t.uuid     "vote_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_id"], name: "index_voting_starts_on_vote_id", using: :btree
  end

  add_foreign_key "candidates", "votes"
  add_foreign_key "voting_decisions", "candidates"
  add_foreign_key "voting_decisions", "voting_forms"
  add_foreign_key "voting_ends", "votes"
  add_foreign_key "voting_forms", "votes"
  add_foreign_key "voting_receipts", "voting_forms"
  add_foreign_key "voting_starts", "votes"
end
