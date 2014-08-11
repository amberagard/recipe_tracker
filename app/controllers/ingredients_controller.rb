class IngredientsController
  def initialize(origin_recipe)
    @origin_recipe = origin_recipe
  end

  def add
    puts "Do you want to add an ingredient?"
    name = clean_gets
    ingredient = Ingredient.create(name: name, recipe: @origin_recipe)
    if ingredient.new_record?
      puts ingredient.errors.full_messages
    else
      puts "#{name} as been added to the #{@origin_recipe.name} recipe."
    end
  end

  private

  def ingredients
    @ingredients ||= @origin_recipe.ingredients
  end
end
