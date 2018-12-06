class Categorium < ApplicationRecord
  validates :nombre , presence: true { message: 'Ingresar Nombre Valido' }
  validates :descripcion , presence: true { message: 'Ingresar Descripcion' }
end
