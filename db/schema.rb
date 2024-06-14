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

ActiveRecord::Schema[7.0].define(version: 20_240_613_063_544) do
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

  create_table 'attachments', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'attachment_type'
    t.string 'file_url'
    t.bigint 'advance_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['advance_id'], name: 'index_attachments_on_advance_id'
  end

  create_table 'dsa_rates', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'from'
    t.string 'to'
    t.decimal 'rate', precision: 10
    t.bigint 'grade_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['grade_id'], name: 'index_dsa_rates_on_grade_id'
  end

  create_table 'grades', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'category'
    t.string 'position_title'
    t.decimal 'basic_pay', precision: 10
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
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
  add_foreign_key 'attachments', 'advances'
  add_foreign_key 'dsa_rates', 'grades'
  add_foreign_key 'permissions', 'roles'
  add_foreign_key 'users', 'roles'
end
