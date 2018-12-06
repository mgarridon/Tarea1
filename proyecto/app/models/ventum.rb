class Ventum < ApplicationRecord
  has_many :empleado
  has_many :cliente
  has_many :producto
  validates :cantidad , numericality: true
  validates :subtotal , numericality: true
  validates :descuento , numericality: true
  validates :impuesto , numericality: true
  validates :total , numericality: true
end
