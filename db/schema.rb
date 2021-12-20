# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_20_060308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_id", null: false
    t.string "content", limit: 140, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_id"], name: "index_comments_on_tweet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "goal_taggings", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.bigint "goal_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_goal_taggings_on_goal_id"
    t.index ["goal_tag_id"], name: "index_goal_taggings_on_goal_tag_id"
  end

  create_table "goal_tags", force: :cascade do |t|
    t.string "goal_tag_name", limit: 15, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "goal_title", limit: 45, null: false
    t.string "description", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_name", limit: 15, null: false
    t.string "introduction", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "tweet_taggings", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "tweet_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_id"], name: "index_tweet_taggings_on_tweet_id"
    t.index ["tweet_tag_id"], name: "index_tweet_taggings_on_tweet_tag_id"
  end

  create_table "tweet_tags", force: :cascade do |t|
    t.string "tweet_tag_name", limit: 15, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.string "content", limit: 140, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_tweets_on_goal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_account_name", limit: 15, null: false
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_account_name"], name: "index_users_on_user_account_name", unique: true
  end

  add_foreign_key "comments", "tweets"
  add_foreign_key "comments", "users"
  add_foreign_key "goal_taggings", "goal_tags"
  add_foreign_key "goal_taggings", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "tweet_taggings", "tweet_tags"
  add_foreign_key "tweet_taggings", "tweets"
  add_foreign_key "tweets", "goals"
end
