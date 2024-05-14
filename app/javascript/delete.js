$(document).ready(function(){
  $.ajaxSetup({
      headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
  });

  $("[id^='delete-to-list-']").each(function() {
    var button = $(this);

    button.on("click", function(event) {
      event.preventDefault();

      var recipeID = button.attr('id').replace('delete-to-list-', '');
      var url = "/lists/" + recipeID; // 削除用エンドポイント
      var method = "DELETE";

      // DELETEの場合はデータを送信しません
      $.ajax({
        url: url,
        method: method,
        success: function() {
          console.log("Item removed successfully");
          location.reload(true); // この行を修正
        },
        error: function() {
          console.log("Something went wrong while removing the item");
          location.reload(true);
        }
      });
    });    
  });
});