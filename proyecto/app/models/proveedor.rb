class Proveedor < ApplicationRecord
  validates :nombre , presence: true { message: 'Ingresar Nombre Valido' }
  validates :apellido , presence: true { message: 'Ingresar Apellido Valido' }
  validates :direccion , presence: true { message: 'Ingresar Direccion Valida' }
  validates :telefono , numericality: true , length: { is: 9 }
  validates :celular , numericality: true , length: { is: 9 }
  validates :nombre_empresa , presence: true { message: 'Ingresar Nombre de la Empresa' }
  validates :nombre_producto , presence: true { message: 'Ingresar Nombre del Producto' }
end
