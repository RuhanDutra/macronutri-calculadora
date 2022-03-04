class NutriController < ApplicationController
  def buscar_produto
    if params[:produto_1]
      termo = params[:produto_1]
      @product = "produto_1"
    elsif params[:produto_2]
      termo = params[:produto_2]
      @product = "produto_2"
    else
      @product = ""
    end

    @items = []
    2.times do |pg|
      url = "https://www.myfitnesspal.com/pt/food/search?page=#{pg+1}&search=#{termo}"
      @items << NutriSpiderService.parse!(:parse, url: url)
    end

    if response[:status] == :completed && response[:error].nil?
      p "Successfully scraped url"
    else
      p response[:error]
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end

  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  def calcula_correspondencias

  end
end
