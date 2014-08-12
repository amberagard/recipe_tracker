RSpec.describe "Recipe Tracker Main Menu", :integration do
  context "Prints the main menu" do
    it "shows the main menu" do
      actual = run_recipe_tracker_with_input()
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
}
      expect(actual).to include(expected)
    end

    context "the user types in an incorrect command" do
      let(:output){ run_recipe_tracker_with_input("remove") }
      it "prints an informative message" do
        expect(output).to include("'remove' is not a valid selection.")
      end
    end

    context "the user selects 1" do
      let(:output){ run_recipe_tracker_with_input("1") }
      it "should print" do
        expect(output).to include("Please enter a name for the new recipe:")
      end
    end

    context "the user selects 2" do
      let(:output){ run_recipe_tracker_with_input("2") }
      it "should print" do
        expect(output).to include("Please select a recipe you would like to view:")
      end
    end

    context "the user selects 3" do
      let(:output){ run_recipe_tracker_with_input("3") }
      it "should print" do
        expect(output).to include("Please enter an ingredient you would like to search by:")
      end
    end
  end
end
