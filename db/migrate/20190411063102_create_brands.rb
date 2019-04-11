class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name
      t.text :description
      t.text :homepage
      t.string :country_name

      t.timestamps
    end
  end
end
