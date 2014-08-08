class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |i|
      i.text :name
      i.string :time
      i.references :recipe
    end
  end
end
