class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.sub_total = 0
    end
  end

  def items_count
    order.items.sum(:cantidad)
  end

  def add_item(producto_id:, cantidad: 1)
    producto = Producto.find(producto_id)

    order_item = order.items.find_or_initialize_by(
      producto_id: producto_id
    )

    order_item.precio = producto.precio
    order_item.cantidad = cantidad

    order_item.save
  end

  def remove_item(id:)
    order.items.destroy(id)
  end

end
