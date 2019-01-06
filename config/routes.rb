Rails.application.routes.draw do

#  devise_for :users
  devise_for :users, :path_names => { :sign_up => "registro",:sign_in => "login" }
  devise_scope :user do
    authenticated :user do
      get 'index' => "welcome#index"
      get 'login' => "welcome#login"
      get 'register' => "welcome#register"
      get 'asignaciones/index'

      #CRUD Asignaciones
      # Index
      get 'asignaciones' , to: 'asignaciones#index',as: 'asignaciones'
      # Editar
      get 'asignaciones/:id/editar', to: 'asignaciones#editar', as: 'editar_asignacion'
      put 'asignaciones/:id', to: 'asignaciones#update'
      patch 'asignaciones/:id', to: 'asignaciones#update', as:'update_asignacion',action: :update

      # Nuevo
      post 'asignaciones', to: 'asignaciones#crear'
      get 'asignaciones/nuevo' , to: 'asignaciones#nuevo', as: 'nueva_asignacion'
      # Mostrar
      get 'asignaciones/:id', to: 'asignaciones#mostrar', as: 'asignacion'
      # Eliminar
      delete 'asignaciones/:id' , to: 'asignaciones#eliminar'

      #CRUD Horarios
      # Index
      get 'horarios' , to: 'horarios#index',as: 'horarios'
      # Editar
      get 'horarios/:id/editar', to: 'horarios#editar', as: 'editar_horario'
      put 'horarios/:id', to: 'horarios#update'
      patch 'horarios/:id', to: 'horarios#update'

      # Nuevo
      post 'horarios', to: 'horarios#crear'
      get 'horarios/nuevo' , to: 'horarios#nuevo', as: 'nuevo_horario'
      # Mostrar
      get 'horarios/:id', to: 'horarios#mostrar', as: 'horario'
      # Eliminar
      delete 'horarios.:id' , to: 'horarios#eliminar'


      #CRUD Categorias
      # Index
      get 'categorias' , to: 'categorias#index',as: 'categorias'
      # Editar
      get 'categorias/:id/editar', to: 'categorias#editar', as: 'editar_categoria'
      put 'categorias/:id', to: 'categorias#update'
      patch 'categorias/:id', to: 'categorias#update', as:'update_categoria',action: :update

      # Nuevo
      post 'categorias', to: 'categorias#crear'
      get 'categorias/nuevo' , to: 'categorias#nuevo', as: 'nueva_categoria'
      # Mostrar
      get 'categorias/:id', to: 'categorias#mostrar', as: 'categoria'
      # Eliminar
      delete 'categorias.:id' , to: 'categorias#eliminar'

      #CRUD Categorias2
      # Index
      get 'categorias2' , to: 'categorias2#index',as: 'categorias2'
      # Editar
      get 'categorias2/:id/editar', to: 'categorias2#editar', as: 'editar_categoria2'
      put 'categorias2/:id', to: 'categorias2#update'
      patch 'categorias2/:id', to: 'categorias2#update', as:'update_categoria2',action: :update

      # Nuevo
      post 'categorias2', to: 'categorias2#crear'
      get 'categorias2/nuevo' , to: 'categorias2#nuevo', as: 'nueva_categoria2'
      # Mostrar
      get 'categorias2/:id', to: 'categorias2#mostrar', as: 'categoria2'
      # Eliminar
      delete 'categorias2.:id' , to: 'categorias2#eliminar'

      #CRUD Buses
      # Index
      get 'buses' , to: 'buses#index',as: 'buses'
      # Editar
      get 'buses/:id/editar', to: 'buses#editar', as: 'editar_bus'
      put 'buses/:id', to: 'buses#update'
      patch 'buses/:id', to: 'buses#update'

      # Nuevo
      post 'buses', to: 'buses#crear'
      get 'buses/nuevo' , to: 'buses#nuevo', as: 'nuevo_bus'
      # Mostrar
      get 'buses/:id', to: 'buses#mostrar', as: 'bus'
      # Eliminar
      delete 'buses.:id' , to: 'buses#eliminar'

      #CRUD PRODUCTOS
      # Index
      get 'productos' , to: 'productos#index',as: 'productos'
      # Editar
      get 'productos/:id/editar', to: 'productos#editar', as: 'editar_producto'
      put 'productos/:id', to: 'productos#update'
      patch 'productos/:id', to: 'productos#update'

      # Nuevo
      post 'productos', to: 'productos#crear'
      get 'productos/nuevo' , to: 'productos#nuevo', as: 'nuevo_producto'
      # Mostrar
      get 'productos/:id', to: 'productos#mostrar', as: 'producto'
      # Eliminar
      delete 'productos.:id' , to: 'productos#eliminar'

      #CRUD choferes
      # Index
      get 'choferes/' , to: 'choferes#index', as: 'choferes'
      # Editar
      get 'choferes/:id/editar', to: 'choferes#editar', as: 'editar_chofer'
      put 'choferes/:id', to: 'choferes#update', action: :update
      patch 'choferes/:id', to: 'choferes#update', as:'update_chofer',action: :update
      # Nuevo
      get 'choferes/nuevo' , to: 'choferes#nuevo', as: 'nuevo_chofer'
      post 'choferes/', to: 'choferes#crear', as: 'crear_chofer'
      # Mostrar
      get 'choferes/:id', to: 'choferes#mostrar', as: 'chofer'
      # Eliminar
      delete 'choferes.:id' , to: 'choferes#eliminar'


      #CRUD CLIENTES
      # Index
      get 'clientes/' , to: 'clientes#index', as: 'clientes'
      # Editar
      get 'clientes/:id/clientes', to: 'clientes#editar', as: 'editar_cliente'
      put 'clientes/:id', to: 'clientes#update', action: :update
      patch 'clientes/:id', to: 'clientes#update', as:'update_cliente',action: :update
      # Nuevo
      get 'clientes/nuevo' , to: 'clientes#nuevo', as: 'nuevo_cliente'
      post 'clientes/', to: 'clientes#crear', as: 'crear_cliente'
      # Mostrar
      get 'clientes/:id', to: 'clientes#mostrar', as: 'cliente'
      # Eliminar
      delete 'clientes.:id' , to: 'clientes#eliminar'

      #CRUD EMPLEADOS
      # Index
      get 'empleados/' , to: 'empleados#index', as: 'empleados'
      # Editar
      get 'empleados/:id/clientes', to: 'empleados#editar', as: 'editar_empleado'
      put 'empleados/:id', to: 'empleados#update', action: :update
      patch 'empleados/:id', to: 'empleados#update', as:'update_empleado',action: :update
      # Nuevo
      get 'empleados/nuevo' , to: 'empleados#nuevo', as: 'nuevo_empleado'
      post 'empleados/', to: 'empleados#crear', as: 'crear_empleado'
      # Mostrar
      get 'empleados/:id', to: 'empleados#mostrar', as: 'empleado'
      # Eliminar
      delete 'empleados.:id' , to: 'empleados#eliminar'


      #CRUD COMPRAS
      # Index
      get 'compras/' , to: 'compras#index', as: 'compras'
      # Editar
      get 'compras/:id/editar', to: 'compras#editar', as: 'editar_compra'
      put 'compras/:id', to: 'compras#update', action: :update
      patch 'compras/:id', to: 'compras#update', as:'update_compra',action: :update
      # Nuevo
      get 'compras/nuevo' , to: 'compras#nuevo', as: 'nueva_compra'
      post 'compras/', to: 'compras#crear', as: 'crear_compra'
      # Mostrar
      get 'compras/:id', to: 'compras#mostrar', as: 'compra'
      # Eliminar
      delete 'compras.:id' , to: 'compras#eliminar'

      #CRUD proveedores
      # Index
      get 'proveedores/' , to: 'proveedores#index', as: 'proveedores'
      # Editar
      get 'proveedores/:id/editar', to: 'proveedores#editar', as: 'editar_proveedor'
      put 'proveedores/:id', to: 'proveedores#update', action: :update
      patch 'proveedores/:id', to: 'proveedores#update', as:'update_proveedor',action: :update
      # Nuevo
      get 'proveedores/nuevo' , to: 'proveedores#nuevo', as: 'nuevo_proveedor'
      post 'proveedores/', to: 'proveedores#crear', as: 'crear_proveedor'
      # Mostrar
      get 'proveedores/:id', to: 'proveedores#mostrar', as: 'proveedor'
      # Eliminar
      delete 'proveedores.:id' , to: 'proveedores#eliminar'

          #CRUD empresas
          # Index
      get 'empresas' , to: 'empresas#index',as: 'empresas'
          # Editar
      get 'empresas/:id/editar', to: 'empresas#editar', as: 'editar_empresa'
      put 'empresas/:id', to: 'empresas#update'
      patch 'empresas/:id', to: 'empresas#update'

          # Nuevo
      post 'empresas', to: 'empresas#crear'
      get 'empresas/nuevo' , to: 'empresas#nuevo', as: 'nueva_empresa'
          # Mostrar
      get 'empresas/:id', to: 'empresas#mostrar', as: 'empresa'
          # Eliminar
      delete 'empresas.:id' , to: 'empresas#eliminar'

      #CRUD Rutas
      # Index
      get 'rutas' , to: 'rutas#index',as: 'rutas'
      # Editar
      get 'rutas/:id/editar', to: 'rutas#editar', as: 'editar_ruta'
      put 'rutas/:id', to: 'rutas#update'
      patch 'rutas/:id', to: 'rutas#update', as:'update_ruta',action: :update

      # Nuevo
      post 'rutas', to: 'rutas#crear'
      get 'rutas/nuevo' , to: 'rutas#nuevo', as: 'nueva_ruta'
      # Mostrar
      get 'rutas/:id', to: 'rutas#mostrar', as: 'ruta'
      # Eliminar
      delete 'rutas.:id' , to: 'rutas#eliminar'

      get 'welcome/index'
      root 'welcome#index', as: :authenticated_root
      match '*path' => redirect('/'), via: [:get, :post]
    end

    unauthenticated do

      #CRUD Asignaciones
      # Index
      get 'asignaciones' , to: 'asignaciones#index'
      root 'devise/sessions#new', as: :unauthenticated_root
      match '*path' => redirect('/'), via: [:get, :post]
    end
  end
  # root :to => "welcome#index"
  #root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
