class RecipesController
  def add
    puts "Please enter a name for the new recipe:"
    name = clean_gets
    recipe = Recipe.create(name: name)
    if recipe.new_record?
      puts recipe.errors.full_messages
    else
      IngredientsController.new(recipe).add
      InstructionsController.new(recipe).add
      puts "#{name} has been added to your recipes."
    end
  end

  def list
    puts "~~~~~~~"
    puts "RECIPES"
    puts "~~~~~~~"
    puts "Please select a recipe you would like to view:"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}"
    end
  end

  def view(path_number)
    recipe = recipes[path_number - 1]
    if recipe
      puts "Here is the recipe for #{recipe.name}:"
      recipe.ingredients.each_with_index do |ingredient, index|
        puts "#{index + 1}. #{ingredient.amount} #{ingredient.name}"
      end
      puts recipe.instruction.body
    else
      puts "Sorry, recipe #{path_number} doesn't exist"
    end
  end

  def search
    puts "Please enter an ingredient you would like to search by:"
    name = clean_gets.downcase
    puts "Here is a list of recipes that include #{name}:"
    ingredient = Ingredient.where(name: name).each_with_index do |ingredient, index|
      puts "#{index + 1}. #{ingredient.recipe.name}"
    end
    Menu.selection
  end

  def recipes
    @recipes ||= Recipe.all
  end
end
