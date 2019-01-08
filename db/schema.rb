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

ActiveRecord::Schema.define(version: 20190108202810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "rut"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.integer "subtotal"
    t.integer "impuesto"
    t.integer "total"
    t.integer "id_proveedor"
    t.integer "id_producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string "rut"
    t.string "nombre"
    t.string "apellido"
    t.integer "edad"
    t.string "direccion"
    t.integer "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listados", force: :cascade do |t|
    t.integer "id_producto"
    t.integer "id_orden"
    t.float "precio_unico"
    t.integer "cantidad"
    t.float "precio_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordenes", force: :cascade do |t|
    t.float "subtotal"
    t.float "total"
    t.float "impuesto"
    t.float "envio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.string "marca"
    t.string "descripcion"
    t.integer "id_categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "precio_compra"
  end

  create_table "proveedores", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "telefono"
    t.integer "celular"
    t.string "nombre_empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.date "fecha_vencimiento"
    t.integer "id_compra"
    t.integer "id_producto"
    t.integer "id_venta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string "name"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ventas", force: :cascade do |t|
    t.date "fecha"
    t.integer "cantidad"
    t.integer "subtotal"
    t.integer "impuesto"
    t.integer "total"
    t.integer "id_cliente"
    t.integer "id_empleado"
    t.integer "id_producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "compras", "productos", column: "id_producto"
  add_foreign_key "compras", "proveedores", column: "id_proveedor"
  add_foreign_key "listados", "ordenes", column: "id_orden"
  add_foreign_key "listados", "productos", column: "id_producto"
  add_foreign_key "productos", "categorias", column: "id_categoria"
  add_foreign_key "stocks", "compras", column: "id_compra"
  add_foreign_key "stocks", "productos", column: "id_producto"
  add_foreign_key "stocks", "ventas", column: "id_venta"
  add_foreign_key "ventas", "clientes", column: "id_cliente"
  add_foreign_key "ventas", "empleados", column: "id_empleado"
  add_foreign_key "ventas", "productos", column: "id_producto"
end
