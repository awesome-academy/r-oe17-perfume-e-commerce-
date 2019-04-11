class CreateSenses < ActiveRecord::Migration[5.2]
  def change
    create_table :senses do |t|
      t.string :sense_name

      t.timestamps
    end
  end
end
