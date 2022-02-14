class NutriController < ApplicationController
  def buscar_produto
    redirect_to root_path(produtos: ['asdf', 'asdf'])
  end

  def calcula_correspondencias

  end
end
