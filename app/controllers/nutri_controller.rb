class NutriController < ApplicationController
  def buscar_produto
    termo = params[:produto]
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
