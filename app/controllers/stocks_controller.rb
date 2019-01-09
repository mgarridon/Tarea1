class StocksController < ApplicationController


  def index
    @stock= Stock.all
    @compra = Compra.all
    @producto = Producto.all
    @venta = Venta.all

  end


  private
  # Inicializar stock
  def set_stock
    @stock = Stock.find(params[:id])
  end

  # Establecer Parametros
  def stock_params
    params.require(:stock).permit(:fecha_vencimiento, :id_compra, :id_producto, :id_venta)
  end

end
