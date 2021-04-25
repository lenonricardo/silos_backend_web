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

ActiveRecord::Schema.define(version: 2021_04_25_230605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amostras", force: :cascade do |t|
    t.string "json"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "img"
    t.string "descricao"
    t.integer "id_user"
    t.integer "id_empresa"
  end

  create_table "empresas", id: :serial, force: :cascade do |t|
    t.string "razao_social", limit: 255, null: false
    t.string "cnpj", limit: 14, null: false
    t.string "logradouro", limit: 255
    t.string "bairro", limit: 255
    t.integer "cep"
    t.string "telefone", limit: 20
    t.text "img_logo"
    t.string "cidade", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nivel", limit: 5
    t.index ["email"], name: "uk_users", unique: true
  end

  create_table "users_empresas", id: false, force: :cascade do |t|
    t.integer "id_user"
    t.integer "id_empresa"
  end

  add_foreign_key "amostras", "empresas", column: "id_empresa", name: "fk_amostras_empresas"
  add_foreign_key "amostras", "users", column: "id_user", name: "fk_amostras_users"
  add_foreign_key "users_empresas", "empresas", column: "id_empresa", name: "fk_users_empresas_empresas", on_delete: :cascade
  add_foreign_key "users_empresas", "users", column: "id_user", name: "fk_users_empresas_users", on_delete: :cascade
end
