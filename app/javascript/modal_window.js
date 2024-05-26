function modal() {
  $(".detail-btn").click(function() {
    $('#recipeModal .modal-body').html(''); // clear body first

    var recipeIds = $(this).data("recipe-ids");

    if (typeof recipeIds === 'string') {
      recipeIds = recipeIds.split(",");
    } else {
      recipeIds = [recipeIds];
    }

    recipeIds.forEach(function(id) {
      $.ajax({
        url: "/recipes/" + id, 
        type: "GET",
      }).done(function(recipe) {
        var recipeContent = $(recipe).find('.show-recipe-items').html();
        var $modalRecipe = $(recipeContent.replace(/show-/g, 'modal-')); // convert to jQuery object

        // create new elements for each recipe
        var $recipeDetails = $('<div class="recipe-details"></div>'); 
        var $modalImages = $('<div class="modal-images"></div>'); 
        var $modalIngredients = $('<div class="modal-ingredients"></div>'); 
        $recipeDetails.append($modalImages, $modalIngredients);

        // append the image and name to .modal-images
        $modalImages.append($modalRecipe.find('.modal-recipe-img'), $modalRecipe.find('.modal-recipe-name'));  

        // append the rest of the modalRecipe to .modal-ingredients
        $modalIngredients.append($modalRecipe.children().not('.modal-recipe-img , .modal-recipe-name'));

        $('#recipeModal .modal-body').append($recipeDetails); // append to add content

        // Set the z-index
        $('#recipeModal').css("z-index", "9999");

        $('#recipeModal').modal('show');
      }).fail(function() {
        alert("レシピのロードに失敗しました。");
      });
    });
  });
};

$(document).ready(modal);
window.addEventListener("turbo:render", modal);