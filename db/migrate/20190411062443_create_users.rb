class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_active
      t.boolean :is_admin
      t.datetime :date_joined
      t.datetime :last_login

      t.timestamps
    end
  end
end
