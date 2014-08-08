class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |r|
      r.string :name
    end
  end
end
