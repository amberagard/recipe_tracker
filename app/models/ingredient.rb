class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_uniqueness_of :name, message: "already exists"

  def self.options
%q{
Would you like to add an ingredient?:
1. Yes, I'd like to add an ingredient.
2. No, I am done adding ingredients.
}
  end

  def self.selection
    ingredient_controller = IngredientsController.new()
    puts self.options
    input = gets
    return unless input
    input.chomp!
    if input == "1"
      ingredient_controller.add
    elsif input == "2"
      # recipe_controller.list
      # selction = gets
      # recipe_controller.view(selection)
    else puts "'#{input}' is not a valid selection."
      self.selection
    end
  end
end
