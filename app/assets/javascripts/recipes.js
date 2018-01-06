$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_recipes').on('click', event => {
    event.preventDefault()
    history.pushState(null, null, `/recipes`)
    fetch(`/recipes.json`)
      .then(response => response.json())
      .then(recipes => {
        $('#app-container').html('')
        recipes.forEach(recipe => {
          let newRecipe = new Recipe(recipe)
          let recipeHtml = newRecipe.formatIndex()
          $('#app-container').append(recipeHtml)
        })
      })
  })

	// More Button on recipe index
	$(document).on('click', ".js-more", function(event) {
		 event.preventDefault();
       let id = $(this).attr("data-id");
       $.get("/recipes/" + id + ".json", function(recipe) { 
      $("#description-" + id).html(recipe.description);
    })
  })
}

  function Recipe(recipe) {
  this.id = recipe.id
	this.image = recipe.image
  this.name = recipe.name
	this.description = recipe.description
	this.directions = recipe.directions
	this.recipe_ingredients = recipe.recipe_ingredients
	this.comments = recipe.comments
	this.votes_for = recipe.votes_for
	this.user =recipe.user
}


Recipe.prototype.formatIndex = function() {
  let recipeHtml = 
			  `
    
    <div class=" col-xs-12 col-sm-4">
    <div data-aos="flip-left"
     data-aos-easing="ease-out-cubic"
     data-aos-duration="2000">
    <div class="card">
    <a href="/recipes/${this.id}" data-id="${this.id}" class="show_link"><img  src="${this.image}" class="img-responsive card-img-top">
    <div class="card-description">
    <h2>${this.name}</h2></a>
    <p id="description-${this.id}"  class="card-text">${this.description.substring(0, 25)}...</p>
    <a href="#" data-id="${this.id}" class="js-more btn btn-primary btn-sm"> Read More</a><br>
    </div>
    </div>
    </div>
   </div>
  
  
  `
  return recipeHtml
}

