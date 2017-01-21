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

ActiveRecord::Schema.define(version: 20170116210037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest",           default: "",   null: false
    t.boolean  "enabled",                   default: true
    t.boolean  "validated",                 default: true
    t.string   "email_validation_token"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "website"
    t.string   "venue_name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street_address"
    t.string   "postal_code"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "lat",            precision: 10, scale: 6
    t.decimal  "lng",            precision: 10, scale: 6
    t.string   "slug"
    t.integer  "listing_count",                           default: 0
    t.integer  "lfr_count",                               default: 0
    t.integer  "hr_count",                                default: 0
    t.integer  "flag_count",                              default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "flags", force: :cascade do |t|
    t.string   "type_of_flag"
    t.string   "status"
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.integer  "user_id"
    t.integer  "admin_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["admin_id"], name: "index_flags_on_admin_id", using: :btree
    t.index ["flaggable_type", "flaggable_id"], name: "index_flags_on_flaggable_type_and_flaggable_id", using: :btree
    t.index ["user_id"], name: "index_flags_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "listing_assignments", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id", "user_id"], name: "index_listing_assignments_on_listing_id_and_user_id", using: :btree
    t.index ["listing_id"], name: "index_listing_assignments_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_listing_assignments_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.string   "hotel"
    t.string   "listing_type"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street_address"
    t.string   "postal_code"
    t.string   "price"
    t.decimal  "lat",                precision: 10, scale: 6
    t.decimal  "lng",                precision: 10, scale: 6
    t.string   "slug"
    t.integer  "flag_count",                                  default: 0
    t.boolean  "flags_confirmed",                             default: false
    t.datetime "flags_confirmed_at"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.index ["event_id"], name: "index_listings_on_event_id", using: :btree
    t.index ["flags_confirmed"], name: "index_listings_on_flags_confirmed", using: :btree
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest",           default: "",   null: false
    t.boolean  "enabled",                   default: true
    t.boolean  "validated",                 default: true
    t.string   "email_validation_token"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.json     "traits"
    t.integer  "flag_count"
    t.string   "slug"
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
