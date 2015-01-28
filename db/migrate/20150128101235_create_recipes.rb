class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :creator
      t.references :category
      t.references :region
      t.integer :rating
      t.string :title
      t.text :description
      t.text :content
      t.string :url #user can provide recipe content or link
    end
  end
end
