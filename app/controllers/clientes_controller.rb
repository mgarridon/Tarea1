class ClientesController < ApplicationController
  before_action :set_cliente, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @cliente = Cliente.all
  end

  # Crear nuevo
  def nuevo
    @cliente = Cliente.new
  end
  def crear
    @cliente=Cliente.new(cliente_params)
    respond_to do |format|
      if @cliente.valid?
        if @cliente.save
          format.html { redirect_to @cliente, notice: 'Cliente Creado Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @cliente }
        else
          format.html { render :nuevo }
          format.json { render json: @cliente.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
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
      if @cliente.update(cliente_params)
        format.html{redirect_to update_cliente_path(@cliente), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @cliente.destroy
    flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to clientes_path}
    end
  end

  private
  # Inicializar Cliente
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end
  # Establecer Parametros
  def cliente_params
    params.require(:cliente).permit(:rut, :nombre, :apellido, :direccion, :telefono)
  end

end
