class Empleado < ApplicationRecord
  validates :nombre , presence: true { message: 'Ingresar Nombre Valido' }
  validates :apellido , presence: true { message: 'Ingresar Apellido Valido' }
  validates :cedula , presence: true { message: 'Ingresar Rut Valido' }
  validates :sexo , presence: true { message: 'Ingresar Sexo' }
  validates :fecha_nac , numericality: true , length: { maximun: 8 }
  validates :direccion , presence: true { message: 'Ingresar Direccion Valida' }
  validates :telefono , numericality: true , length: { is: 9 }
end
