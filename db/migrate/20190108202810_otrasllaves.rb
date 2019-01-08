class Otrasllaves < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :listados, :productos, column: :id_producto, primary_key: :id
    add_foreign_key :listados, :ordenes, column: :id_orden, primary_key: :id
  end
end
