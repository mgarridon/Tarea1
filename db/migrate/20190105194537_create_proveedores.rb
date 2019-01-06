class CreateProveedores < ActiveRecord::Migration[5.1]
  def change
    create_table :proveedores do |t|
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.integer :telefono
      t.integer :celular
      t.string :nombre_empresa
      t.string :nombre_producto

      t.timestamps
    end
  end
end
