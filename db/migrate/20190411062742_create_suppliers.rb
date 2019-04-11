class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :contact_name
      t.text :homepage
      t.text :address
      t.string :city

      t.timestamps
    end
  end
end
