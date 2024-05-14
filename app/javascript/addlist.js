$(document).ready(function(){
  $.ajaxSetup({
      headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
  });

  // ボタンのID毎に処理を行う
  $("[id^='add-to-list-']").each(function() {
    var button = $(this);
    var recipeID = button.attr('id').replace('add-to-list-', '');

    // ボタンの初期表示をセット
    $.ajax({
      url: "/lists/check/" + recipeID,
      method: "GET",
      success: function(response){
        var is_added = response.is_added;
        if (is_added) {
          button.text("リストから削除");
        } else {
          button.text("リストに追加");
        }
      }
    });

    // クリックイベント
    button.off('click').on("click", function(event) {
      event.preventDefault();

      if ($(this).text() == "リストに追加") {
        $(this).text("リストから削除");
      } else {
        $(this).text("リストに追加");
      }

      $.ajax({
        url: "/lists/check/" + recipeID,
        method: "GET",
        success: function(response){
          var is_added = response.is_added;
          var url, method, requestData;
          if (is_added) {
            url = "/lists/" + recipeID; // 削除用のエンドポイント
            method = "DELETE";
          } else {
            url = "/lists";             // 追加用のエンドポイント
            method = "POST";
            requestData = {
              list: {
                recipe_id: recipeID
              }
            };
          }

          if (requestData) { //POSTの場合のみdataを送信します
            $.ajax({
              url: url,
              method: method,
              data: requestData,
              success: function() {
                //アイテムが正常に追加された後の処理をここに書く
                console.log("Item added successfully");
              },
              error: function() {
                //エラーコールバック
                console.log("Something went wrong while adding the item");
              }
            });
          } else { //DELETEの場合はデータを送信しません
            $.ajax({
              url: url,
              method: method,
              success: function() {
                //アイテムが正常に削除された後の処理をここに書く
                console.log("Item removed successfully");
              },
              error: function() {
                //エラーコールバック
                console.log("Something went wrong while removing the item");
              }
            });
          };
        }
      });
    });
  });
});