class OrderesItemController < ApplicationController

  def index
    @items = current_cart.order.items
  end

  def show
    @items = current_cart.order_items
  end

  def create
    current_cart.add_item(
      producto_id: params[:producto_id],
      cantidad: params[:cantidad]
    )

    redirect_to productos_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cart_path
  end


end
