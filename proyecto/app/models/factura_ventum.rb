class FacturaVentum < ApplicationRecord
  belongs_to :venta
  validates :num_empleado , numericality: true
  validates :total_factura_integer , numericality: true
end
