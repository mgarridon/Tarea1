class OrderesController < ApplicationController


  def index
    @order = Order.all
  end

  def new
    @order = current_cart.order
  end

  def create
    @order = current_cart.order

    if @order.update_attributes(order_params.merge(status: 'open'))
      session[:cart_token] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:nombre, :apellido)
  end



  def eliminar
    begin
      @order.destroy
      flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
    end
    respond_to do |format|
      format.html {redirect_to orderes_path}
    end
  end



end