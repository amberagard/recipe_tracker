RSpec.describe "View Current Recipes", :integration do
  context "Prints a list of the current recipes" do
    before do
      Recipe.create(name: "cake")
    end
    
    it "shows the current recipes" do
      actual = run_recipe_tracker_with_input(2)
      expected =%q{
 _    _        _                                    _
| |  | |      | |                                  | |
| |  | |  ___ | |  ___   ___   _ __ ___    ___     | |_   ___
| |/\| | / _ \| | / __| / _ \ | '_ ` _ \  / _ \    | __| / _ \
\  /\  /|  __/| || (__ | (_) || | | | | ||  __/    | |_ | (_) |
 \/  \/  \___||_| \___| \___/ |_| |_| |_| \___|     \__| \___/


______              _                  _____                     _
| ___ \            (_)                |_   _|                   | |
| |_/ /  ___   ___  _  _ __    ___      | |   _ __   __ _   ___ | | __  ___  _ __
|    /  / _ \ / __|| || '_ \  / _ \     | |  | '__| / _` | / __|| |/ / / _ \| '__|
| |\ \ |  __/| (__ | || |_) ||  __/     | |  | |   | (_| || (__ |   < |  __/| |
\_| \_| \___| \___||_|| .__/  \___|     \_/  |_|    \__,_| \___||_|\_\ \___||_|
                      | |
                      |_|

Select an option from the choices below:
1. Create new recipe
2. View current recipes
3. Find recipes by ingredient
~~~~~~~
RECIPES
~~~~~~~
Please select a recipe you would like to view:
1. cake
}
      expect(actual).to include(expected)
    end
  end

  context "prints the selected recipe" do
    before do
      recipe = Recipe.create(name: "cake")
      Ingredient.create(amount: "1 cup", name: "flour", recipe: recipe)
      Ingredient.create(amount: "2", name: "eggs", recipe: recipe)
      Instruction.create(body: "mix and bake", recipe: recipe)
    end

    it "should print a recipe" do
      actual = run_recipe_tracker_with_input(2, 1)
      expected =%q{
 _    _        _                                    _
| |  | |      | |                                  | |
| |  | |  ___ | |  ___   ___   _ __ ___    ___     | |_   ___
| |/\| | / _ \| | / __| / _ \ | '_ ` _ \  / _ \    | __| / _ \
\  /\  /|  __/| || (__ | (_) || | | | | ||  __/    | |_ | (_) |
 \/  \/  \___||_| \___| \___/ |_| |_| |_| \___|     \__| \___/


______              _                  _____                     _
| ___ \            (_)                |_   _|                   | |
| |_/ /  ___   ___  _  _ __    ___      | |   _ __   __ _   ___ | | __  ___  _ __
|    /  / _ \ / __|| || '_ \  / _ \     | |  | '__| / _` | / __|| |/ / / _ \| '__|
| |\ \ |  __/| (__ | || |_) ||  __/     | |  | |   | (_| || (__ |   < |  __/| |
\_| \_| \___| \___||_|| .__/  \___|     \_/  |_|    \__,_| \___||_|\_\ \___||_|
                      | |
                      |_|

Select an option from the choices below:
1. Create new recipe
2. View current recipes
3. Find recipes by ingredient
~~~~~~~
RECIPES
~~~~~~~
Please select a recipe you would like to view:
1. cake
Here is the recipe for cake:
1. 1 cup flour
2. 2 eggs
mix and bake
}
      expect(actual).to include(expected)
    end
  end
end
