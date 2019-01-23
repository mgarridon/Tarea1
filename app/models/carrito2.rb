class Carrito2 < ApplicationRecord


  validates :id_producto, presence: {message: "Debes seleccionar un producto"}
  validates :cantidad, presence: {message: "Debe asignar un stock"}, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

  before_save :precio_act_producto


  private
  def precio_act_producto
    self.precio_act = (Producto.find(id_producto)).precio_compra
  end
end
