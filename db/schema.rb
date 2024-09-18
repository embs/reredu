# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2010_08_30_125544) do
  create_table "acquisitions", force: :cascade do |t|
    t.integer "course_id"
    t.integer "acquired_by_id"
    t.string "acquired_by_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.decimal "value", precision: 8, scale: 2, default: "0.0"
  end

  create_table "alternatives", force: :cascade do |t|
    t.string "statement", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "annotations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.text "content"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "audiences", force: :cascade do |t|
    t.string "name"
  end

  create_table "audiences_schools", id: false, force: :cascade do |t|
    t.integer "audience_id"
    t.integer "school_id"
  end

  create_table "bdrb_job_queues", force: :cascade do |t|
    t.text "args"
    t.string "worker_name"
    t.string "worker_method"
    t.string "job_key"
    t.integer "taken"
    t.integer "finished"
    t.integer "timeout"
    t.integer "priority"
    t.datetime "submitted_at", precision: nil
    t.datetime "started_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.datetime "archived_at", precision: nil
    t.string "tag"
    t.string "submitter_info"
    t.string "runner_info"
    t.string "worker_key"
    t.datetime "scheduled_at", precision: nil
  end

  create_table "beta_candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "role"
    t.boolean "invited"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "bulletins", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "school_id"
    t.string "state"
    t.integer "owner"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "course_resources", force: :cascade do |t|
    t.string "name"
    t.string "attachment_file_name"
    t.integer "attachment_file_size"
    t.string "attachment_content_type"
    t.datetime "attachment_updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "attachable_id"
    t.string "attachable_type"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "rating_average", limit: 10, default: 0
    t.integer "owner", null: false
    t.text "description", null: false
    t.boolean "published", default: false
    t.datetime "media_updated_at", precision: nil
    t.string "state"
    t.integer "view_count", default: 0
    t.boolean "public", default: true
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.boolean "removed", default: false
    t.string "courseable_type"
    t.integer "courseable_id"
    t.integer "simple_category_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at", precision: nil
  end

  create_table "credits", force: :cascade do |t|
    t.decimal "value", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "state"
    t.string "payment_type"
    t.integer "customer_id"
    t.string "customer_type"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "emails", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.integer "last_send_attempt", default: 0
    t.text "mail"
    t.datetime "created_on", precision: nil
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "owner"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.text "description"
    t.string "location"
    t.string "state"
    t.integer "school_id"
    t.boolean "public", default: false
  end

  create_table "exam_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.datetime "done_at", precision: nil
    t.integer "correct_count", default: 0
    t.boolean "public", default: false
    t.integer "time"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "name", null: false
    t.text "description"
    t.boolean "published", default: false
    t.integer "done_count", default: 0
    t.float "total_correct", default: 0.0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "instruction"
    t.integer "level", default: 2
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.boolean "public", default: true
    t.boolean "removed", default: false
    t.integer "simple_category_id"
    t.string "state"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "favoritable_id"
    t.string "favoritable_type"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.datetime "date_modified", precision: nil
    t.integer "user_id"
    t.integer "parent_id"
    t.integer "school_id"
  end

  create_table "followship", id: false, force: :cascade do |t|
    t.integer "followed_by_id"
    t.integer "follows_id"
  end

  create_table "group_permissions", force: :cascade do |t|
    t.integer "folder_id"
    t.integer "group_id"
    t.integer "school_id"
    t.boolean "can_create", default: false
    t.boolean "can_read", default: false
    t.boolean "can_update", default: false
    t.boolean "can_delete", default: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.boolean "is_the_administrators_group", default: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.boolean "sender_deleted", default: false
    t.boolean "recipient_deleted", default: false
    t.string "subject"
    t.text "body"
    t.datetime "read_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "metro_areas", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "users_count", default: 0
  end

  create_table "myfiles", force: :cascade do |t|
    t.integer "folder_id"
    t.integer "user_id"
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at", precision: nil
  end

  create_table "pages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "question_exam_associations", id: false, force: :cascade do |t|
    t.integer "total_answers_count"
    t.integer "correct_answers_count"
    t.integer "question_id"
    t.integer "exam_id"
    t.integer "position"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "questions", force: :cascade do |t|
    t.text "statement", null: false
    t.integer "answer_id"
    t.integer "author_id"
    t.boolean "public", default: false
    t.text "justification"
    t.integer "image_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "category_id"
    t.integer "subcategory_id"
    t.integer "subsubcategory_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rateable_id"
    t.string "rateable_type"
    t.integer "stars", null: false
    t.string "dimension"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "redu_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "redu_categories_schools", id: false, force: :cascade do |t|
    t.integer "redu_category_id"
    t.integer "school_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "school_role", null: false
  end

  create_table "school_assets", force: :cascade do |t|
    t.string "asset_type", null: false
    t.integer "asset_id", null: false
    t.integer "school_id", null: false
    t.integer "view_count", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "key_price", precision: 8, scale: 2
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "owner", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at", precision: nil
    t.boolean "public_profile", default: true
    t.integer "submission_type", default: 1
    t.integer "subscription_type"
    t.string "path"
    t.string "theme", default: "default"
    t.boolean "removed", default: false
    t.boolean "public", default: true
    t.integer "courses_count", default: 0
    t.integer "members_count", default: 0
  end

  create_table "seminars", force: :cascade do |t|
    t.string "media_file_name"
    t.string "media_content_type"
    t.integer "media_file_size"
    t.time "media_updated_at"
    t.string "external_resource"
    t.string "external_resource_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "published", default: false
    t.boolean "public", default: false
    t.string "state"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "sessid"
    t.text "data"
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.index ["sessid"], name: "index_sessions_on_sessid"
  end

  create_table "simple_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "text"
    t.integer "in_response_to_id"
    t.string "in_response_to_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "kind"
    t.integer "user_id"
    t.integer "statusable_id", null: false
    t.string "statusable_type", null: false
    t.boolean "log", default: false
    t.string "logeable_type"
    t.integer "logeable_id"
    t.string "log_action"
    t.string "logeable_name"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "user_school_associations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "school_id"
    t.integer "role_id", default: 7
    t.integer "access_key_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.text "description"
    t.integer "avatar_id"
    t.string "crypted_password"
    t.string "password_salt"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "persistence_token"
    t.string "activation_code", limit: 40
    t.datetime "activated_at", precision: nil
    t.integer "state_id"
    t.integer "metro_area_id"
    t.string "login_slug"
    t.boolean "notify_comments", default: true
    t.boolean "notify_friend_requests", default: true
    t.boolean "notify_community_news", default: true
    t.integer "country_id"
    t.datetime "last_login_at", precision: nil
    t.string "zip"
    t.date "birthday"
    t.string "gender"
    t.boolean "profile_public", default: true
    t.integer "role_id", default: 3
    t.integer "followers_count", default: 0
    t.integer "follows_count", default: 0
    t.integer "score", default: 0
    t.string "first_name"
    t.string "last_name"
    t.boolean "my_activity", default: true
    t.boolean "removed", default: false
    t.string "single_access_token"
    t.string "perishable_token"
    t.integer "login_count", default: 0
    t.integer "failed_login_count", default: 0
    t.datetime "last_request_at", precision: nil
    t.datetime "current_login_at", precision: nil
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.string "oauth_token"
    t.string "oauth_secret"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at", precision: nil
    t.index ["activated_at"], name: "index_users_on_activated_at"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["last_request_at"], name: "index_users_on_last_request_at"
    t.index ["login"], name: "index_users_on_login"
    t.index ["login_slug"], name: "index_users_on_login_slug"
    t.index ["oauth_token"], name: "index_users_on_oauth_token"
    t.index ["persistence_token"], name: "index_users_on_persistence_token"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "vote", default: false
    t.integer "voteable_id", null: false
    t.string "voteable_type", null: false
    t.integer "voter_id"
    t.string "voter_type"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["voteable_id", "voteable_type"], name: "fk_voteables"
    t.index ["voter_id", "voter_type"], name: "fk_voters"
  end
end
