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

ActiveRecord::Schema.define(version: 20170715134146) do

  create_table "commits", force: :cascade do |t|
    t.integer "repo_id"
    t.string "sha", null: false
    t.text "message", null: false
    t.string "author_name", null: false
    t.string "author_email", null: false
    t.string "author_avatar_url"
    t.datetime "commited_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repo_id"], name: "index_commits_on_repo_id"
    t.index [nil, "sha"], name: "index_commits_on_repo_and_sha", unique: true
  end

  create_table "repos", force: :cascade do |t|
    t.string "owner", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stars_count", default: 0, null: false
    t.integer "open_issues_count", default: 0, null: false
    t.string "owner_avatar_url"
    t.integer "update_status", default: 0, null: false
    t.index ["owner", "name"], name: "index_repos_on_owner_and_name", unique: true
  end

end
