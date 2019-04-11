class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.datetime :required_date
      t.datetime :shipped_date
      t.integer :customer_id
      t.text :ship_address
      t.string :ship_name
      t.string :ship_city

      t.timestamps
    end
  end
end
