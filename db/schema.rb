# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_240_612_105_838) do
  create_table 'advances', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'advance_type'
    t.string 'status'
    t.decimal 'amount', precision: 10
    t.integer 'verified_by'
    t.integer 'confirmed_by'
    t.integer 'dispatch_by'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_advances_on_user_id'
  end

  create_table 'permissions', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'resource', null: false
    t.json 'actions', null: false
    t.bigint 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['role_id'], name: 'index_permissions_on_role_id'
  end

  create_table 'roles', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username'
    t.bigint 'role_id', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['role_id'], name: 'index_users_on_role_id'
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'advances', 'users'
  add_foreign_key 'permissions', 'roles'
  add_foreign_key 'users', 'roles'
end
