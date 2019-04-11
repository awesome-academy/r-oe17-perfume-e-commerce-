class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :quantity_per_init
      t.decimal :unit_price
      t.integer :unit_in_stock
      t.integer :unit_in_order
      t.boolean :discontinue
      t.integer :reorderlevel
      t.string :concentration
      t.string :product_style
      t.integer :weight
      t.text :description
      t.text :picture_url
      t.references :category, foreign_key: true
      t.references :supplier, foreign_key: true
      t.references :sense, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
