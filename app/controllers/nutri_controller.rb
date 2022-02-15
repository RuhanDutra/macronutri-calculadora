class NutriController < ApplicationController
  def buscar_produto
    termo = params[:produto_1]

    # mechanize example
    # agent = Mechanize.new
    # page = agent.get("https://www.myfitnesspal.com/pt/food/search?search=#{termo}")

    url = "https://www.myfitnesspal.com/pt/food/search?search=#{termo}"
    reponse = NutriSpider.process(url)
    byebug
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
    redirect_to root_path(produtos: ['asdf', 'asdf'])
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  def calcula_correspondencias

  end
end
