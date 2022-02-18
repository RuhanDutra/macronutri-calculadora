class Item < ApplicationRecord
  has_one :nutritional_content, dependent: :destroy

  enum category: {
    carbohydrates: 0,
    protein: 1,
    fat: 2
  }

  after_create :add_category

  private

  def add_category
    macros = self.nutritional_content.slice('fat', 'carbohydrates', 'protein')
    self.category = macros.key(macros.values.max)
    self.save
  rescue
    puts "$$$$$$$$$$$$$$$$$$ ERRO AO ADICIONAR CATEGORIA ITEM #{self.id} $$$$$$$$$$$$$$$$$$"
  end
end
