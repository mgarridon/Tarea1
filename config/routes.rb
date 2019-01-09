Rails.application.routes.draw do



#match 'users/registro' => redirect('/'), via: [:get, :post]

#  devise_for :users
  devise_for :users, :path_names => { :sign_up => "registro",:sign_in => "login" }
  devise_scope :user do
    authenticated :user do

      get 'index' => "welcome#index"
      get 'login' => "welcome#login"
      get 'register' => "welcome#register"

      get '/cart', to: 'orderes_item#index'
      resources :orderes_item, path: '/cart/items'



      #CRUD CATEGORIAS
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



      #CRUD PRODUCTOS
      # Index
      get 'productos' , to: 'productos#index',as: 'productos'
      # Editar
      get 'productos/:id/editar', to: 'productos#editar', as: 'editar_producto'
      put 'productos/:id', to: 'productos#update'
      patch 'productos/:id', to: 'productos#update', as:'update_producto',action: :update

      # Nuevo
      post 'productos', to: 'productos#crear'
      get 'productos/nuevo' , to: 'productos#nuevo', as: 'nuevo_producto'
      # Mostrar
      get 'productos/:id', to: 'productos#mostrar', as: 'producto'
      # Eliminar
      delete 'productos.:id' , to: 'productos#eliminar'




      #CRUD CLIENTES
      # Index
      get 'clientes' , to: 'clientes#index', as: 'clientes'
      # Editar
      get 'clientes/:id/editar', to: 'clientes#editar', as: 'editar_cliente'
      put 'clientes/:id', to: 'clientes#update'
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
      get 'empleados' , to: 'empleados#index', as: 'empleados'
      # Editar
      get 'empleados/:id/editar', to: 'empleados#editar', as: 'editar_empleado'
      put 'empleados/:id', to: 'empleados#update'
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
      get 'compras' , to: 'compras#index', as: 'compras'
      # Editar
      get 'compras/:id/editar', to: 'compras#editar', as: 'editar_compra'
      put 'compras/:id', to: 'compras#update'
      patch 'compras/:id', to: 'compras#update', as:'update_compra',action: :update
      # Nuevo
      get 'compras/nuevo' , to: 'compras#nuevo', as: 'nueva_compra'
      post 'compras/', to: 'compras#crear', as: 'crear_compra'
      # Mostrar
      get 'compras/:id', to: 'compras#mostrar', as: 'compra'
      # Eliminar
      delete 'compras.:id' , to: 'compras#eliminar'



      #CRUD VENTAS
      # Index
      get 'ventas' , to: 'ventas#index', as: 'ventas'
      # Editar
      get 'ventas/:id/editar', to: 'ventas#editar', as: 'editar_venta'
      put 'ventas/:id', to: 'ventas#update'
      patch 'ventas/:id', to: 'ventas#update', as:'update_venta',action: :update
      # Nuevo
      get 'ventas/nuevo' , to: 'ventas#nuevo', as: 'nueva_venta'
      post 'ventas/', to: 'ventas#crear', as: 'crear_venta'
      # Mostrar
      get 'ventas/:id', to: 'ventas#mostrar', as: 'venta'
      # Eliminar
      delete 'ventas.:id' , to: 'ventas#eliminar'



      #CRUD PROVEEDORES
      # Index
      get 'proveedores' , to: 'proveedores#index', as: 'proveedores'
      # Editar
      get 'proveedores/:id/editar', to: 'proveedores#editar', as: 'editar_proveedor'
      put 'proveedores/:id', to: 'proveedores#update'
      patch 'proveedores/:id', to: 'proveedores#update', as:'update_proveedor',action: :update
      # Nuevo
      get 'proveedores/nuevo' , to: 'proveedores#nuevo', as: 'nuevo_proveedor'
      post 'proveedores/', to: 'proveedores#crear', as: 'crear_proveedor'
      # Mostrar
      get 'proveedores/:id', to: 'proveedores#mostrar', as: 'proveedor'
      # Eliminar
      delete 'proveedores.:id' , to: 'proveedores#eliminar'



      get 'welcome/index'
      root 'welcome#index', as: :authenticated_root
      match '*path' => redirect('/'), via: [:get, :post]

    end

    unauthenticated do

      #CRUD PRODUCTOS
      # Index
      get 'productos' , to: 'productos#index'
      get '/cart', to: 'orderes_item#index'
      resources :orderes_item, path: '/cart/items'
      root 'welcome#index'
      root 'devise/sessions#new', as: :unauthenticated_root
      match '*path' => redirect('/'), via: [:get, :post]

    end
  end
  # root :to => "welcome#index"
  #root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
