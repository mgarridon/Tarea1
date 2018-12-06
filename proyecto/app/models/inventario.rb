class Inventario < ApplicationRecord
  has_many :producto
  has_many :compra
  validates :existencia , presence: true { message: 'Ingresar si existe' }
  validates :fecha_vencimiento , numericality: true
  validates :descripcion , presence: true { message: 'Ingresar Descrpcion' }
end
