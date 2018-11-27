class CreateInventarios < ActiveRecord::Migration[5.2]
  def change
    create_table :inventarios do |t|
      t.references :producto, foreign_key: true
      t.references :compra, foreign_key: true
      t.string :existencia
      t.integer :fecha_vencimiento
      t.string :descripcion

      t.timestamps
    end
  end
end
