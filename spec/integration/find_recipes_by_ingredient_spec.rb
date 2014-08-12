RSpec.describe "Find Recipes By Ingredient", :integration do
  context "display recipes" do
    before do
      recipe = Recipe.create(name: "cake")
      Ingredient.create(amount: "1 cup", name: "flour", recipe: recipe)
      Ingredient.create(amount: "2", name: "eggs", recipe: recipe)
      Instruction.create(body: "mix and bake", recipe: recipe)
    end

    it "should display the recipes that contain the ingredient entered" do
      actual = run_recipe_tracker_with_input(3, "flour")
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
Please enter an ingredient you would like to search by:
Here is a list of recipes that include flour:
1. cake

Select an option from the choices below:
1. Create new recipe
2. View current recipes
3. Find recipes by ingredient
}
      expect(actual).to include(expected)
    end
  end
end
