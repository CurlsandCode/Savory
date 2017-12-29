$(function () {
$(".js-more").on('click', function(event){
		event.preventDefault();
		var id = $(this).data("id");
		$.get("/recipes/" + id + ".json", function(data) {
			$("#body-" + id).text(data["body"]);
			});
		});
});