// More Button on recipe index
$(document).on('click', ".js-more", function(event) {
		 event.preventDefault();
       let id = $(this).attr("data-id");
       $.get("/recipes/" + id + ".json", function(recipe) { 
      $("#description-" + id).html(recipe.description);
    })
  }) 