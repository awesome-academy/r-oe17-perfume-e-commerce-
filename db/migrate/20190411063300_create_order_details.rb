class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.decimal :unit_price
      t.integer :quantity
      t.float :discount
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
