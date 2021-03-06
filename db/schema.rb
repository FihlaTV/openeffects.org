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

ActiveRecord::Schema.define(version: 20150216222104) do

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",              default: "", null: false
    t.text     "description"
    t.string   "url"
    t.integer  "contact_id"
    t.text     "address"
    t.date     "joined"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true, using: :btree

  create_table "contents", force: true do |t|
    t.string   "identifier"
    t.string   "title"
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",          default: false
    t.string   "pdf_title"
  end

  add_index "contents", ["identifier"], name: "index_contents_on_identifier", using: :btree
  add_index "contents", ["published"], name: "index_contents_on_published", using: :btree
  add_index "contents", ["title"], name: "index_contents_on_title", using: :btree

  create_table "home_heros", force: true do |t|
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "minutes", force: true do |t|
    t.string   "meeting",    default: "",    null: false
    t.date     "date"
    t.string   "location"
    t.text     "members"
    t.text     "observing"
    t.text     "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",  default: false
    t.string   "slug"
  end

  add_index "minutes", ["date"], name: "index_minutes_on_date", using: :btree
  add_index "minutes", ["meeting"], name: "index_minutes_on_meeting", using: :btree
  add_index "minutes", ["published"], name: "index_minutes_on_published", using: :btree
  add_index "minutes", ["slug"], name: "index_minutes_on_slug", unique: true, using: :btree

  create_table "news_items", force: true do |t|
    t.string   "headline",   default: "",    null: false
    t.date     "date"
    t.text     "summary",                    null: false
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "news_items", ["date"], name: "index_news_items_on_date", using: :btree
  add_index "news_items", ["headline"], name: "index_news_items_on_headline", using: :btree
  add_index "news_items", ["published"], name: "index_news_items_on_published", using: :btree
  add_index "news_items", ["slug"], name: "index_news_items_on_slug", unique: true, using: :btree

  create_table "standard_changes", force: true do |t|
    t.integer  "version_id"
    t.text     "committee"
    t.string   "title"
    t.string   "type"
    t.string   "status"
    t.text     "status_details"
    t.text     "overview"
    t.text     "solution"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "discussion"
    t.string   "slug"
    t.integer  "sponsor_id"
    t.integer  "last_editor_id"
    t.boolean  "archived",       default: false
  end

  add_index "standard_changes", ["archived"], name: "index_standard_changes_on_archived", using: :btree
  add_index "standard_changes", ["last_editor_id"], name: "index_standard_changes_on_last_editor_id", using: :btree
  add_index "standard_changes", ["slug"], name: "index_standard_changes_on_slug", unique: true, using: :btree
  add_index "standard_changes", ["sponsor_id"], name: "index_standard_changes_on_sponsor_id", using: :btree
  add_index "standard_changes", ["version_id"], name: "index_standard_changes_on_version_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "roles_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false
    t.string   "company_or_org"
    t.string   "slug"
    t.boolean  "notifications"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["company_or_org"], name: "index_users_on_company_or_org", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["notifications"], name: "index_users_on_notifications", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "version"
    t.string   "status"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "committee"
  end

end
