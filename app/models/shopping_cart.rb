class ShoppingCart


  delegate :sub_total, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
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

    ActiveRecord::Base.transaction do
      order_item.save
      update_sub_total!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_sub_total!
    end
  end

  def update_sub_total!
    order.sub_total = order.items.sum('cantidad * precio')
    order.save
  end


end
