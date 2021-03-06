class ProductosController < ApplicationController
  before_action :set_producto, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @producto = Producto.all
    @categoria = Categoria.all
  end

  # Crear nuevo
  def nuevo
    @producto = Producto.new
    @categoria = Categoria.all
  end
  def crear
    @categoria=Categoria.all
    @producto=Producto.new(producto_params)
    respond_to do |format|
      if @producto.valid?
        if @producto.save
          format.html { redirect_to @producto, notice: 'Producto Creado Correctamente' }
          format.json { render :mostrar, status: :created, location: @producto }
        else
          format.html { render :nuevo }
          format.json { render json: @producto.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
    @id_producto = params[:id]
    @categoria = Producto.select("id_categoria").where("id = ?",@id_producto)
  end
  # Actualizar/Editar
  def editar
    @categorias = Categoria.all
  end
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html{redirect_to @producto, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @producto.destroy
    flash[:success] = 'Se Borró Con Éxito'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to productos_path}
    end
  end



  private
  # Inicializar Producto
  def set_producto
    @producto = Producto.find(params[:id])
  end
  # Establecer Parametros
  def producto_params
    params.require(:producto).permit(:nombre, :precio, :precio_compra, :marca, :descripcion, :id_categoria, :cantidad)
  end
end
