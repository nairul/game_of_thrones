class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :character_name
      t.references :house, index: true, foreign_key: true
    end
  end
end
