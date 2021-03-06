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

ActiveRecord::Schema.define(version: 20151018183108) do

  create_table "actualities", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  add_index "actualities", ["user_id"], name: "index_actualities_on_user_id"

  create_table "alerts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "level"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicant_attachments", force: true do |t|
    t.string   "name"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "id_applicant"
  end

  create_table "applicant_statuses", force: true do |t|
    t.integer  "id_applicant"
    t.boolean  "is_finish"
    t.integer  "is_complete"
    t.boolean  "ok_for_interview"
    t.integer  "interview_result"
    t.datetime "interview_date"
    t.integer  "applicant_response"
    t.boolean  "is_refused"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicants", force: true do |t|
    t.datetime "deposit_date"
    t.string   "name"
    t.string   "first_name"
    t.string   "address"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "home_phone"
    t.string   "private_phone"
    t.string   "email"
    t.datetime "birth"
    t.string   "birth_place"
    t.string   "nationality"
    t.string   "assurance"
    t.boolean  "status"
    t.boolean  "has_connection"
    t.text     "connection_desc"
    t.text     "know_formation"
    t.integer  "english_skill"
    t.string   "other_language"
    t.text     "after_school"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step_position"
    t.boolean  "graduation",      default: false
  end

  add_index "applicants", ["assurance"], name: "index_applicants_on_assurance", unique: true

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description",  limit: 4294967295
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "phone_number"
    t.string   "website"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "logo_url"
    t.date     "founded_at"
    t.integer  "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursus", force: true do |t|
    t.integer  "id_applicant"
    t.string   "graduation"
    t.integer  "year"
    t.string   "option"
    t.string   "result"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "alt"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "job_name"
    t.string   "job_number"
    t.text     "job_description", limit: 4294967295
    t.string   "start_at"
    t.string   "duration"
    t.text     "profil",          limit: 4294967295
    t.string   "contact"
    t.string   "location"
    t.text     "skills",          limit: 4294967295
    t.integer  "status"
    t.date     "founded_at"
    t.integer  "posted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "options", force: true do |t|
    t.string "key"
    t.string "value"
  end

  create_table "other_applications", force: true do |t|
    t.integer  "id_applicant"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_experiences", force: true do |t|
    t.integer  "id_applicant"
    t.integer  "year"
    t.string   "company"
    t.string   "role"
    t.text     "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_applicants", force: true do |t|
    t.integer  "id_applicant"
    t.string   "project_type"
    t.integer  "year"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbmail_file_name"
    t.string   "thumbmail_content_type"
    t.integer  "thumbmail_file_size"
    t.datetime "thumbmail_updated_at"
  end

  create_table "tipcategories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tips", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "address"
    t.string   "url"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "end_at"
    t.string   "status"
    t.string   "category"
    t.string   "email"
    t.text     "map",         limit: 255
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "lastname"
    t.string   "name"
    t.string   "photo"
    t.string   "twitter"
    t.string   "description"
    t.string   "linkin"
    t.integer  "id_applicant"
    t.string   "facebook"
    t.string   "github"
    t.string   "googleplus"
    t.date     "birth"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_infos", force: true do |t|
    t.integer "user_id"
    t.string  "current_job_title"
    t.text    "current_job_desc",       limit: 4294967295
    t.string  "lp_job_title"
    t.text    "lp_job_desc",            limit: 4294967295
    t.integer "graduation_year",        limit: 4,          default: 0
    t.string  "current_average_salary"
    t.string  "lp_average_salary"
    t.binary  "cv"
  end

  add_index "users_infos", ["id"], name: "index_users_infos_on_id", unique: true

  create_table "votes", force: true do |t|
    t.integer  "id_applicant"
    t.integer  "id_voter"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
