class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.references :recipe
      t.references :category
    end
  end
end
