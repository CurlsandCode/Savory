# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) User has_many Recipes
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) Recipe belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) Recipe has many Ingredients through RecipeIngredients
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) recipe_ingredient.quantity
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) User,Recipe,Ingredient,Direction all validate presence of data
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) latest_recipes, by_alphabet
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) /recipe/new, Ingredient
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (OmniAuth-Facebook)
- [x] Include nested resource show or index (URL e.g. users/2/recipes) user/1/recipes
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) user/1/recipes/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) /recipes/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate