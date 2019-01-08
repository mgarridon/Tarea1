class ListadosController < ApplicationController

	def create
		@orden = current_orden
		@listado = @orden.listados.new(listado_params)
		@orden.save
		session[:id_orden] = @orden.id
		redirect_to productos_path
	end

	def update
		@orden = current_orden
		@listado = @orden.listados.find(params[:id])
		@listado.update_attributes(listado_params)
		@listados = @orden.listados
		redirect_to carts_path
	end

	def destroy
		@orden = current_orden
		@listado = @orden.listados.find(params[:id])
		@listado.destroy
		@listados = @orden.listados
		redirect_to carts_path
	end

	private
	def listado_params
		params.require(:listado).permit(:id_producto, :cantidad)
	end
	
end
