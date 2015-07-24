class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
