class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :amount
      t.string :unit
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end