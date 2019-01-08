class OrderesItemController < ApplicationController

	def create
		@order = current_order
		@order_item = @order.orderes_item.new(order_item_params)
		@order.save
		session[:order_id] = @order.id
		redirect_to productos_path
	end

	def update
		@order = current_order
		@order_item = @order.orderes_item.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@orderes_item = @order.orderes_item
	end

	def destroy
		@order = current_order
		@order_item = @order.orderes_item.find(params[:id])
		@order_item.destroy
		@orderes_item = @order.orderes_item
	end

	private
		def order_item_params
			params.require(:order_item).permit(:product_id, :quantity)
		end
end
