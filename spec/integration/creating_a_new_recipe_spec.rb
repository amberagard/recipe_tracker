RSpec.describe "Creating a new recipe", :integration do
  context "valid input" do
    let!(:output){ run_recipe_tracker_with_input(1, "Chicken Alfredo") }

    # it "should add the name" do
    #   expect(Recipe.count).to eql 1
    # end

    it "should save the name accurately" do
      expect(Recipe.last.name).to eql "Chicken Alfredo"
    end

    it "should print a success message" do
      expect(output).to include("Chicken Alfredo has been added to your recipes.")
    end
  end

  context "invalid input" do
    let(:long_string){ "foo" * 20 }
    let!(:output){ run_recipe_tracker_with_input(1, "Chicken Alfredo", long_string) }

    it "prints the error message for the type of invalid input" do
      expect(output).to include("Name must be less than 60 characters")
    end

    # it "shouldn't save the new name" do
    #   expect(Recipe.count).to eql 0
    # end
  end
end
