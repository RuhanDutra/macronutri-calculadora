class NutriController < ApplicationController
  def buscar_produto
    termo = params[:produto_1]
    agent = Mechanize.new
    page = agent.get("https://www.myfitnesspal.com/pt/food/search?search=#{termo}")

    byebug
    redirect_to root_path(produtos: ['asdf', 'asdf'])
  end

  def calcula_correspondencias

  end
end
