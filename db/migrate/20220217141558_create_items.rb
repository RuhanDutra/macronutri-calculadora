class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :verified, default: false
      t.integer :category

      t.timestamps
    end
  end
end
