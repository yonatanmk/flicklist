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

ActiveRecord::Schema.define(version: 20170311183131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name",         null: false
    t.string "profile_path"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name",         null: false
    t.string "profile_path"
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id",  null: false
    t.integer "actor_id",  null: false
    t.string  "character", null: false
    t.index ["actor_id"], name: "index_movie_actors_on_actor_id", using: :btree
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id", using: :btree
  end

  create_table "movie_directors", force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "director_id", null: false
    t.index ["director_id"], name: "index_movie_directors_on_director_id", using: :btree
    t.index ["movie_id"], name: "index_movie_directors_on_movie_id", using: :btree
  end

  create_table "movie_recs", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "rec_id",   null: false
    t.index ["movie_id"], name: "index_movie_recs_on_movie_id", using: :btree
    t.index ["rec_id"], name: "index_movie_recs_on_rec_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "poster_path"
    t.string   "release_date"
    t.text     "overview"
    t.boolean  "adult",        default: false
    t.string   "status"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "recs", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "poster_path"
    t.datetime "release_date"
    t.text     "overview"
    t.boolean  "adult",        default: false
    t.string   "status"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_movies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.string  "status",   default: "seen"
    t.index ["movie_id"], name: "index_user_movies_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_user_movies_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
