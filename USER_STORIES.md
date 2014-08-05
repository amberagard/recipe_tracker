# Stories

## User creates a new recipe

As a user
In order to create a new recipe
I want to enter a name, ingredients, instructions, and any notes I have about the recipe.

Acceptance Criteria:
* User selects create recipe option
* User enters a name, ingredients, instructions, and notes
* New recipe is saved to the database

Usage example:

      run ./recipes
      press 1 to select "Create New Recipe"
      enter the appropriate information as prompted

## User views current recipes

As a user
In order to view a list of recipes available to me
I want to select the view recipes option from the main menu

Acceptance Criteria:
* User selects the view recipes option from the main menu
* Recipes currently in the database are displayed by their name

Usage example:

      run ./recipes
      press 2 to select "View Current Recipes"
      press the number of the recipe you want to view
      recipe name, ingredients, instructions, and notes are displayed

## User enters an ingredient to get recipes using that ingredient

As a user
In order to get a recipe suggestion
I want to to be able to enter an ingredient and get a list of recipes that use that ingredient

Acceptance Criteria:
* User selects the enter ingredient option from the main menu
* User enters an ingredient and a list of recipes using that ingredient is displayed

Usage example:

      run ./recipes
      press 3 to select "Find Recipes By Ingredient"
      press the number of the recipe you want to view
      recipe name, ingredients, instructions, and notes are displayed

## User edits a recipe

As a user
In order to edit a recipe
I want to select the edit recipe option from the main menu

Acceptance Criteria:
* User selects the edit recipe option from the main menu
* User selects a recipe they'd like to edit
* The user is able to edit the recipe
* The recipe is saved with the new information in the database

Usage example:

      run ./recipes
      press 4 to select "Edit A Recipe"
      press the number of the recipe you want to edit
      edit the things you want and save

## User makes notes about a recipe

As a user
In order to make a recipe better for the next time I make it
I want to be able to make notes about that recipe

Acceptance Criteria
* A user can select a recipe and leave notes about that recipe
* The recipe is saved with the new information in the database

Usage example:

      run ./recipes
      press 4 to select "Edit A Recipe"
      press the number of the recipe you want to edit
      add notes to the recipe and save
