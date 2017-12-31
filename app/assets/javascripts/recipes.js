$(function () {
  $(".js-more").on('click', function(event) {
		event.preventDefault();
    var id = $(this).data("id");
    $.get("/recipes/" + id + ".json", function(data) {
      $("#description-" + id).text(data["description"]);
    });
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