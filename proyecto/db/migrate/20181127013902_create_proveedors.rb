class CreateProveedors < ActiveRecord::Migration[5.2]
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.integer :telefono
      t.integer :telefono
      t.integer :celular
      t.string :nombre_empresa
      t.string :nombre_producto

      t.timestamps
    end
  end
end
