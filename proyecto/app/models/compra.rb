class Compra < ApplicationRecord
  has_many :proveedor
  validates :fecha , numericality: true
  validates :cantidad , numericality: true
  validates :subtotal , numericality: true
  validates :impuesto , numericality: true
  validates :descuento , numericality: true
  validates :total , numericality: true
end
