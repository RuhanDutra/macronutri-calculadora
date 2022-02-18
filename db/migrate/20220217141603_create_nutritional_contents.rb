class CreateNutritionalContents < ActiveRecord::Migration[6.1]
  def change
    create_table :nutritional_contents do |t|
      t.integer :portion
      t.integer :unit
      t.float :unit_g_multiplier
      t.integer :calories
      t.float :calcium
      t.float :carbohydrates
      t.float :cholesterol
      t.float :fat
      t.float :fiber
      t.float :iron
      t.float :monounsaturated_fat
      t.float :polyunsaturated_fat
      t.float :potassium
      t.float :protein
      t.float :saturated_fat
      t.float :sodium
      t.float :sugar
      t.float :trans_fat
      t.float :vitamin_a
      t.float :vitamin_c
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
