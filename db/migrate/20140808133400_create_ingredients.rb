class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |i|
      i.string :name
      i.string :amount
      i.references :recipe
    end
  end
end
