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

ActiveRecord::Schema.define(version: 2018_11_27_042941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade do |t|
    t.bigint "proveedor_id"
    t.integer "fecha"
    t.integer "cantidad"
    t.integer "subtotal"
    t.integer "impuesto"
    t.integer "descuento"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_compras_on_proveedor_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "cedula"
    t.string "sexo"
    t.integer "fecha_nac"
    t.string "direccion"
    t.integer "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factura_venta", force: :cascade do |t|
    t.bigint "venta_id"
    t.integer "num_empleado"
    t.string "total_factura_integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venta_id"], name: "index_factura_venta_on_venta_id"
  end

  create_table "inventarios", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "compra_id"
    t.string "existencia"
    t.integer "fecha_vencimiento"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["compra_id"], name: "index_inventarios_on_compra_id"
    t.index ["producto_id"], name: "index_inventarios_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.integer "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categoria_id"
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.integer "telefono"
    t.integer "celular"
    t.string "nombre_empresa"
    t.string "nombre_producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venta", force: :cascade do |t|
    t.bigint "empleado_id"
    t.bigint "cliente_id"
    t.integer "cantidad"
    t.integer "subtotal"
    t.integer "descuento"
    t.integer "impuesto"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "producto_id"
    t.index ["cliente_id"], name: "index_venta_on_cliente_id"
    t.index ["empleado_id"], name: "index_venta_on_empleado_id"
    t.index ["producto_id"], name: "index_venta_on_producto_id"
  end

  add_foreign_key "compras", "proveedors"
  add_foreign_key "factura_venta", "venta", column: "venta_id"
  add_foreign_key "inventarios", "compras"
  add_foreign_key "inventarios", "productos"
  add_foreign_key "productos", "categoria", column: "categoria_id"
  add_foreign_key "venta", "clientes"
  add_foreign_key "venta", "empleados"
  add_foreign_key "venta", "productos"
end
