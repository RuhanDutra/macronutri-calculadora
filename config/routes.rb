Rails.application.routes.draw do
  root 'home#index'

  controller :nutri do
    get "nutri/buscar_produto" => :buscar_produto
    get "nutri/calcula_correspondencias" => :calcula_correspondencias
  end
end
