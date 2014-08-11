class RecipesController
  def add
    puts "Please enter a name for the new recipe:"
    name = clean_gets
    recipe = Recipe.create(name: name)
    if recipe.new_record?
      puts recipe.errors.full_messages
    else
      ingredient_controller()
      puts "#{name} has been added to your recipes."
    end
  end

  def list
    puts "~~~~~~~"
    puts "RECIPES"
    puts "~~~~~~~"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}"
    end
  #  Router.navigate_recipes_menu(self)
  end

  def view(path_number)

    puts "Please select a recipe you would like to view:"
    recipe = recipe[path_number - 1]
    if recipe
      puts "Here is the recipe you selected:"
    else
      puts "Sorry, recipe #{path_number} doesn't exist"
    end
  end

  def search
    puts "Please enter an ingredient you would like to search by:"
    name = clean_gets
    puts "Here is a list of recipes that include the ingredient you specified:"
  end

  def edit
    puts "Please select a recipe you would like to edit:"
    recipe = recipe[path_number - 1]
    if recipe
      puts "Here is the recipe you selected:"
    else
      puts "Sorry, recipe #{path_number} doesn't exist"
    end
  end

  def recipes
    @recipes ||= Recipe.all
  end
end
