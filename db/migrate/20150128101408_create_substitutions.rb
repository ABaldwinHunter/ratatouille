class CreateSubstitutions < ActiveRecord::Migration
  def change
    create_table :substitutions do |t|
      t.references :ingredient
      t.references :substitute
    end
  end
end
