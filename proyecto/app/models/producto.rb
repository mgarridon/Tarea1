class Producto < ApplicationRecord
  belongs_to :categoria
  validates :nombre , presence: true { message: 'Ingresar Nombre Valido' }
  validates :precio , numericality: true
  validates :descripcion , presence: true { message: 'Ingresar Descripcion' }
end
