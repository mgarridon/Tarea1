class Ventum < ApplicationRecord
  belongs_to :cliente
  belongs_to :producto
  belongs_to :empleado
end
