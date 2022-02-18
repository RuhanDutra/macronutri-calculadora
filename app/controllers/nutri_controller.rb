class NutriController < ApplicationController
  def buscar_produto
    termo = params[:produto]
    @items = []

    2.times do |pg|
      url = "https://www.myfitnesspal.com/pt/food/search?page=#{pg+1}&search=#{termo}"
      @items << NutriSpider.parse!(:parse, url: url)
    end

    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
    redirect_to root_path(produtos: @items)
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  def calcula_correspondencias

  end
end
