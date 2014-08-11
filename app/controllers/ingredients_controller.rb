class IngredientsController
  def initialize(origin_recipe)
    @origin_recipe = origin_recipe
  end

  def add
    puts Ingredient.options
    answer = clean_gets
    if answer == "1"
      puts "Ingredient name: "
      name = clean_gets
      puts "Ingredient amount: "
      amount = clean_gets
      ingredient = Ingredient.create(name: name, recipe: @origin_recipe, amount: amount)
      if ingredient.valid?
        puts "#{name} as been added to the #{@origin_recipe.name} recipe."
        add
      else
        puts ingredient.errors.full_messages
      end
    end
  end

  private

  def ingredients
    @ingredients ||= @origin_recipe.ingredients
  end
end
