class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :category_id
      t.integer :kondate_id
      t.string :people
      t.references :user

      t.timestamps
    end
  end
end
