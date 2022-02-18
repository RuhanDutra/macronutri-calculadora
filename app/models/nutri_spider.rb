class NutriSpider < Kimurai::Base
  @name = "nutri_items_spider"
  @engine = :mechanize
  @start_urls = []
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    before_request: { delay: 4..7 }
  }

  def parse(response, url:, data: {})
    js = response.search("script").text[/\items\":(.*?),\"totalResultsCount\":/,1]
    items = JSON.parse(js)
    items_parse = []

    items.each do |item|
      params_item = {
        name: item.dig("item", "brand_name"),
        description: item.dig("item", "description"),
        verified: item.dig("item", "verified")
      }
      novo_item = Item.find_or_initialize_by(params_item)
      if novo_item.id.blank?
        novo_item = Item.new(params_item)
        nutritional = NutritionalContent.new
        nutritional.portion = item.dig("item", "serving_sizes", 0, "value") || 0
        nutritional.unit_g_multiplier = item.dig("item", "serving_sizes", 1, "nutrition_multiplier") || 0
        nutritional.unit = item.dig("item", "nutritional_contents", "energy", "unit") || 0
        nutritional.calories = item.dig("item", "nutritional_contents", "energy", "value") || 0
        nutritional.calcium = item.dig("item", "nutritional_contents", "calcium") || 0
        nutritional.carbohydrates = item.dig("item", "nutritional_contents", "carbohydrates") || 0
        nutritional.cholesterol = item.dig("item", "nutritional_contents", "cholesterol") || 0
        nutritional.fat = item.dig("item", "nutritional_contents", "fat") || 0
        nutritional.fiber = item.dig("item", "nutritional_contents", "fiber") || 0
        nutritional.iron = item.dig("item", "nutritional_contents", "iron") || 0
        nutritional.monounsaturated_fat = item.dig("item", "nutritional_contents", "monounsaturated_fat") || 0
        nutritional.polyunsaturated_fat = item.dig("item", "nutritional_contents","polyunsaturated_fat") || 0
        nutritional.potassium = item.dig("item", "nutritional_contents", "potassium") || 0
        nutritional.protein = item.dig("item", "nutritional_contents", "protein") || 0
        nutritional.saturated_fat = item.dig("item", "nutritional_contents", "saturated_fat") || 0
        nutritional.sodium = item.dig("item", "nutritional_contents", "sodium") || 0
        nutritional.sugar = item.dig("item", "nutritional_contents", "sugar") || 0
        nutritional.trans_fat = item.dig("item", "nutritional_contents", "trans_fat") || 0
        nutritional.vitamin_a = item.dig("item", "nutritional_contents", "vitamin_a") || 0
        nutritional.vitamin_c = item.dig("item", "nutritional_contents", "vitamin_c") || 0

        novo_item.nutritional_content = nutritional
        novo_item.save
      end
      items_parse << novo_item
    end

    return items_parse
  end
end
