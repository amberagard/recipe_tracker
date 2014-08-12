RSpec.describe "Creating a new recipe", :integration do
  context "valid input" do
    let!(:output){ run_recipe_tracker_with_input(1, "Chicken Alfredo", 1, "chicken", "1 pound", 2, "These are the instructions.") }

    it "should save the name accurately" do
      expect(Recipe.last.name).to eql "Chicken Alfredo"
    end

    it "should save an ingredient name accurately" do
      expect(Ingredient.last.name).to eql "chicken"
    end

    it "should save an ingredient amount accurately" do
      expect(Ingredient.last.amount).to eql "1 pound"
    end

    it "should save the instructions accurately" do
      expect(Instruction.last.body).to eql "These are the instructions."
    end

    it "should print a success message" do
      expect(output).to include("Chicken Alfredo has been added to your recipes.")
    end
  end

  context "invalid input - long string" do
    let(:long_string){ "foo" * 21 }
    let!(:output){ run_recipe_tracker_with_input(1, long_string) }

    it "prints the error message for the type of invalid input" do
      expect(output).to include("Name must be less than 60 characters")
    end
  end

  context "invalid input - numbers" do
    let(:numbers){ "123" }
    let!(:output){ run_recipe_tracker_with_input(1, numbers) }

    it "prints the error message for typing in numbers" do
      expect(output).to include("Name must include letters")
    end
  end

  before do
    recipe = Recipe.create(name: "cake")
  end

  context "invalid input - name already exists - recipes" do
    let(:recipe_name){ "cake" }
    let!(:output){ run_recipe_tracker_with_input(1, recipe_name) }

    it "prints the error message for name already exists" do
      expect(output).to include("Name already exists")
    end
  end

  before do
    recipe = Recipe.create(name: "cake")
    Ingredient.create(amount: "1 cup", name: "flour", recipe: recipe)
  end

  context "invalid input - name already exists - ingredients" do
    let(:ingredient_name){ "flour" }
    let!(:output){ run_recipe_tracker_with_input(1, "cake", ingredient_name) }

    it "prints the error message for name already exists" do
      expect(output).to include("Name already exists")
    end
  end
end
