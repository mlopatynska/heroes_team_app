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

ActiveRecord::Schema.define(version: 20180203214857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.text "body"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["tenant_id"], name: "index_comments_on_tenant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.string "youtube"
    t.string "twitter"
    t.string "linkedincompany"
    t.string "facebook"
    t.string "angellist"
    t.string "owler"
    t.string "crunchbasecompany"
    t.string "pinterest"
    t.string "google"
    t.string "klout"
    t.string "overview"
    t.integer "founded"
    t.integer "approx_employees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "logo"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "companies_industries", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "industry_id", null: false
    t.index ["company_id", "industry_id"], name: "index_companies_industries_on_company_id_and_industry_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_contacts_on_email"
    t.index ["name"], name: "index_contacts_on_name"
    t.index ["phone"], name: "index_contacts_on_phone"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "status"
    t.boolean "readed", default: false
    t.string "content"
    t.integer "user_id"
    t.bigint "notificable_id"
    t.string "notificable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "page_type"
    t.string "title"
    t.string "content_html"
    t.string "content"
    t.string "source_url"
    t.string "status"
    t.string "screenshot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.integer "rating", default: 0
    t.index ["company_id"], name: "index_pages_on_company_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "website"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_tenants_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "sale"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.string "auth_token"
    t.datetime "token_created_at"
    t.date "birthday"
    t.string "avatar"
    t.string "phone"
    t.string "skills"
    t.string "social_links"
    t.text "education"
    t.text "work"
    t.text "about"
    t.string "provider"
    t.string "uid"
    t.index ["auth_token", "token_created_at"], name: "index_users_on_auth_token_and_token_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
    t.index ["uid"], name: "index_users_on_uid"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.text "embed_code"
    t.integer "videoable_id"
    t.string "videoable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["videoable_id", "videoable_type"], name: "index_videos_on_videoable_id_and_videoable_type"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.index ["tenant_id"], name: "index_visits_on_tenant_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "companies", "users"
  add_foreign_key "pages", "companies"
  add_foreign_key "users", "tenants"
end
