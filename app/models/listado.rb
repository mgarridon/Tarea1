class Listado < ApplicationRecord

  belongs_to :orden
  belongs_to :producto

  before_save :set_precio_unico
  before_save :set_precio_total

  def precio_unico
    if persisted?
      self[:precio_unico]
    else
      producto.precio
    end
  end

  def precio_total
    precio_unico * cantidad
  end

  private

  def set_precio_unico
    self[:precio_unico] = precio_unico
  end

  def set_precio_total
    self[:precio_total] = cantidad * set_precio_unico
  end
  
end
