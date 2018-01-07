$(() => {
  bindClickHandlers()
})
//Link to user show page
const bindClickHandlers = () => {
	$('.user').on('click', function(event) {
    event.preventDefault()
     history.pushState(null, null, `/user/profile`)
    fetch(`/user/profile.json`)
    .then(response => response.json())
    .then(user => {
      $('#app-container').html('')
      let newUser = new User(user)
      let userHtml = newUser.formatShow()
      $('#app-container').append(userHtml);
    })
  })
 

	// More Button on recipe index
	$(document).on('click', ".js-more", function(event) {
		 event.preventDefault();
       let id = $(this).attr("data-id");
       $.get("/recipes/" + id + ".json", function(recipe) { 
      $("#description-" + id).html(recipe.description);
    });
  });
};


  function User(user) {
  this.id = user.id;
	this.avatar = user.avatar;
  this.username = user.username;
	this.bio = user.bio;
	this.recipes = user.recipes;
}


User.prototype.formatShow = function() {
  let userHtml = 
			  `
    
   
   <div class="container">    
      <div class="jumbotron">
         <div class="row">
            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
              <img  src="${this.avatar}" class="img-responsive">
                </div>
                   <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                     <div class="container" style="border-bottom:1px solid black">
                        <h2> ${this.username} </h2>
                        </div>
                            <hr>
                             <p>${this.bio}</p>
                          <ul class="container details">
                            <li><p><span class="glyphicon glyphicon-cutlery" style="width:50px;"></span>${this.recipes.length} Recipes Added</p></li>
                            <li class="lineup"><a href="/users/edit" data-id="${this.id}" class=" btn btn-primary btn-sm"> Edit Your Profile</a><br></li>
                            <li class="lineup"><a href="#" data-id="${this.id}" data: { confirm: "Are you sure?" }, method: :delete, class=" btn btn-primary btn-sm"> Delete Your Profile</a><br></li>
                            <li class="lineup"><a href="/users/${this.id}/recipes/new " class=" btn btn-primary btn-sm"> Add Recipe</a><br></li>
                          </ul>
                         </div>
                      </div>
                    </div>
                </div>
  `
  return userHtml
}
 //Comments

// Load Comments
$(() => {
  $("a.load_comments").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol")
      $ol.html("")
      json.forEach(function(comment){
      $ol.append("<li>" + comment.body + "</li>");
      })
    })
  e.preventDefault();
  })
});

// Create Comment
function Comment(comment) {
  this.id = comment.id;
  this.body = comment.body;
  this.user = comment.user;
}



Comment.prototype.renderDisplay = function() {
  var html = "" ;
  html += '<blockquote>'+ "<div class=\'well-white well-white\' id=\'comment-\' + comment.id + '\'>" +  "<strong>" + this.user.username + "</strong>" + " commented: " + this.body + "</div>" + '</blockquote>';
  $("#submitted-comments").append(html);
}

$(function() {
  $("form#new_comment").on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      $(".commentBox").val("");
      var comment = new Comment(json);
      comment.renderDisplay();

    })
  })
})