class Cliente < ApplicationRecord
  validates :nombre , presence: true { message: 'Ingresar Nombre Valido' }
  validates :apellido , presence: true { message: 'Ingresar Apellido Valido' }
  validates :direccion , presence: true { message: 'Ingresar Direccion Valida' }
  validates :telefono , numericality: true , length: { is: 9 }
end
