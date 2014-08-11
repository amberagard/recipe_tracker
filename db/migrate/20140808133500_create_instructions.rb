class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |i|
      i.text :body
      i.references :recipe
    end
  end
end
