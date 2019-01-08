class Orden < ApplicationRecord

  has_many :listados
  before_save :set_subtotal

  def subtotal
    listados.collect {|listado| listado.valid? ? (listado.precio_unico*listado.cantidad) : 0}.sum
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end

end
