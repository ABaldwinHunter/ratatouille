class Favorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :recipe
    end
  end
end
