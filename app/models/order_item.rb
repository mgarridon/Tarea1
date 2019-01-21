class OrderItem < ApplicationRecord



  belongs_to :order
  belongs_to :producto

  def set_precio_total
    self[:precio_total] = precio * cantidad
  end

end
