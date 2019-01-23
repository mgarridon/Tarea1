class Carrito < ApplicationRecord


  validates :id_producto, presence: {message: "Debes seleccionar un producto"}
  validates :cantidad, presence: {message: "Debe asignar un stock"}, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 300}
  validate :Cantidad_Stock #Validar que la cantidad a comprar sea menor al stock disponible

  before_save :precio_act_producto



  def Cantidad_Stock
    if id_producto != nil
      producto = Producto.select("cantidad, nombre, id").where("id = ?", id_producto)
      if cantidad.to_i > producto[0].cantidad.to_i
        errors.add(:cantidad, "Cantidad supera el stock disponible. Stock disponible de: "+producto[0].nombre.to_s+": "+producto[0].cantidad.to_s)
      end
    end
  end

  private
  def precio_act_producto
    self.precio_act = (Producto.find(id_producto)).precio
  end
end
