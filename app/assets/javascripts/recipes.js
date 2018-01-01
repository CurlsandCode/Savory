$(function () {
  $(".js-more").on('click', function(event) {
    var recipeId = $(this).attr("data-id");
    $.get("/recipes/" + recipeId + ".json", function(recipe) {
      $("#description-" + recipeId).html(recipe.description);
    });
	 event.preventDefault();
  });
});

$(function (){
	$(".js-next").on("click", function(){
	var nextID = parseInt($(".js-next").attr("data-id")) + 1;
	$.get("/recipes/" + nextID + ".json", function(data) {
		$(".recipeImage").text(data["image"]);
		$(".recipeName").text(data["name"]);
		$(".recipeDescription").text(data["description"]);
		$(".chefName").text(data["user"]["username"]);
		$(".recipeIngredients").text(data["quantity"]["ingredient"]["name"]);
		$(".recipeSteps").text(data["step"]);
		$("js-next").attr("data-id", data["id"]);
	});
	});
 });