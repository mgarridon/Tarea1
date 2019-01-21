class ComprasController < ApplicationController
  before_action :set_compra, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @compra = Compra.all
    @productos = Producto.all
    @proveedores = Proveedor.all
  end

  # Crear nuevo
  def nuevo
    @compra = Compra.new
    @productos = Producto.all
    @proveedores = Proveedor.all
  end
  def crear
    @proveedores = Proveedor.all
    @productos = Producto.all
    @compra=Compra.new(compra_params)
    respond_to do |format|
      if @compra.valid?
        if @compra.save
          format.html { redirect_to @compra, notice: 'Compra Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @compra }
        else
          format.html { render :nuevo }
          format.json { render json: @compra.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar
    @proveedores = Proveedor.all
    @productos = Producto.all
  end
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html{redirect_to update_compra_path(@compra), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @compra.destroy
    flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to compras_path}
    end
  end

  private
  # Inicializar Compra
  def set_compra
    @compra = Compra.find(params[:id])
  end
  # Establecer Parametros
  def compra_params
    params.require(:compra).permit(:fecha, :cantidad, :subtotal,:total, :id_proveedor,  :id_producto)
  end

end
