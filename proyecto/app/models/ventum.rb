class Ventum < ApplicationRecord
  has_many :empleado
  has_many :cliente
  has_many :producto
end
