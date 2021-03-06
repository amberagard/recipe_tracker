class Menu
  def self.options
%q{
Select an option from the choices below:
1. Create new recipe
2. View current recipes
3. Find recipes by ingredient
}
  end


  def self.selection
    recipe_controller = RecipesController.new()
    puts self.options
    input = gets
    return unless input
    input.chomp!
    if input == "1"
      recipe_controller.add
    elsif input == "2"
      recipe_controller.list
      recipe = clean_gets.to_i
      recipe_controller.view(recipe)
    elsif input == "3"
      recipe_controller.search
    else
      puts "'#{input}' is not a valid selection."
      self.selection
    end
  end
end
