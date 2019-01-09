class ProveedoresController < ApplicationController
  before_action :set_proveedor, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @proveedor = Proveedor.all
  end

  # Crear nuevo
  def nuevo
    @proveedor = Proveedor.new
  end
  def crear
    @proveedor=Proveedor.new(proveedor_params)
    respond_to do |format|
      if @proveedor.valid?
        if @proveedor.save
          format.html { redirect_to @proveedor, notice: 'Proveedor Creado Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @proveedor }
        else
          format.html { render :nuevo }
          format.json { render json: @proveedor.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar

  end
  def update
    respond_to do |format|
      if @proveedor.update(proveedor_params)
        format.html{redirect_to update_proveedor_path(@proveedor), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @proveedor.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to proveedores_path}
    end
  end

  private
  # Inicializar Proveedor
  def set_proveedor
    @proveedor = Proveedor.find(params[:id])
  end
  # Establecer Parametros
  def proveedor_params
    params.require(:proveedor).permit(:rut, :nombre, :apellido, :direccion, :telefono, :celular, :nombre_empresa, :nombre_producto)
  end

end
