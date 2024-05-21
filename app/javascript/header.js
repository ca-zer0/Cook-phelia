function pullDown() {
  console.log('click event fired!');
  const pullDownButton = document.getElementById("lists");
  const pullDownLists = document.getElementById('btn');
  const imgTag = document.querySelector('.user-btn');
  const originalSrc = imgTag.getAttribute('src');
  const pullDownParents = document.getElementById("pull-down");
  const pullDownList = document.getElementById("down-lists");
  const search = document.getElementById('search-btn');
  const shopping = document.getElementById('shopping-btn');
  const userEdit = document.getElementById('user-edit');
  const userOut = document.getElementById('user-out');
  const items = document.getElementsByClassName('form-items');

  // イベントハンドラ関数
  function mouseOverFunc() {
    this.setAttribute('src', '/assets/user2.jpg');
  }

  function mouseOutFunc() {
    this.setAttribute('src', originalSrc);
  }

  function pullDownButtonClick() {
    if (pullDownParents.getAttribute("style") === "display:block;") {
      pullDownParents.removeAttribute("style");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  }

  function pullDownListsMouseOver() {
    this.setAttribute("style", "background-color:#155791;");
  }

  function pullDownListsMouseOut() {
    this.removeAttribute("style");
  }

  function pullDownListsClick() {
    if (pullDownList.getAttribute("style") === "display:block;") {
      pullDownList.removeAttribute("style");

      for (let i = 0; i < items.length; i++) {
        items[i].style.display = 'none';
      }
    } else {
      pullDownList.setAttribute("style", "display:block;");
    }
  }

  function searchMouseOver() {
    search.style.fontWeight = "bold";
  }

  function searchMouseOut() {
    search.style.fontWeight = "normal";
  }

  function searchClick() {
    for (let i = 0; i < items.length; i++) {
      if (items[i].style.display === 'none' || items[i].style.display === '') {
        items[i].style.display = 'block';
      } else {
        items[i].style.display = 'none';
      }
    }
  }

  function shoppingMouseOver() {
    shopping.style.fontWeight = "bold";
  }

  function shoppingMouseOut() {
    shopping.style.fontWeight = "normal";
  }

  function userEditMouseOver() {
    userEdit.style.fontWeight = "bold";
  }

  function userEditMouseOut() {
    userEdit.style.fontWeight = "normal";
  }

  function userOutMouseOver() {
    userOut.style.fontWeight = "bold";
  }

  function userOutMouseOut() {
    userOut.style.fontWeight = "normal";
  }

  // イベントリスナーを削除する関数
  function removeEventListeners() {
    imgTag.removeEventListener('mouseover', mouseOverFunc);
    imgTag.removeEventListener('mouseout', mouseOutFunc);
    pullDownButton.removeEventListener('click', pullDownButtonClick);
    pullDownLists.removeEventListener('mouseover', pullDownListsMouseOver);
    pullDownLists.removeEventListener('mouseout', pullDownListsMouseOut);
    pullDownLists.removeEventListener('click', pullDownListsClick);
    search.removeEventListener('mouseover', searchMouseOver);
    search.removeEventListener('mouseout', searchMouseOut);
    search.removeEventListener('click', searchClick);
    shopping.removeEventListener('mouseover', shoppingMouseOver);
    shopping.removeEventListener('mouseout', shoppingMouseOut);
    userEdit.removeEventListener('mouseover', userEditMouseOver);
    userEdit.removeEventListener('mouseout', userEditMouseOut);
    userOut.removeEventListener('mouseover', userOutMouseOver);
    userOut.removeEventListener('mouseout', userOutMouseOut);
  }

  // イベントリスナーを追加する関数
  function addEventListeners() {
    // 既存のイベントリスナーを全て削除
    removeEventListeners();

    // イベントリスナーを再追加
    imgTag.addEventListener('mouseover', mouseOverFunc);
    imgTag.addEventListener('mouseout', mouseOutFunc);
    pullDownButton.addEventListener('click', pullDownButtonClick);
    pullDownLists.addEventListener('mouseover', pullDownListsMouseOver);
    pullDownLists.addEventListener('mouseout', pullDownListsMouseOut);
    pullDownLists.addEventListener('click', pullDownListsClick);
    search.addEventListener('mouseover', searchMouseOver);
    search.addEventListener('mouseout', searchMouseOut);
    search.addEventListener('click', searchClick);
    shopping.addEventListener('mouseover', shoppingMouseOver);
    shopping.addEventListener('mouseout', shoppingMouseOut);
    userEdit.addEventListener('mouseover', userEditMouseOver);
    userEdit.addEventListener('mouseout', userEditMouseOut);
    userOut.addEventListener('mouseover', userOutMouseOver);
    userOut.addEventListener('mouseout', userOutMouseOut);
  }

  // 初期イベントリスナーの追加
  addEventListeners();
}

// ドキュメントの準備ができたらイベントリスナーを追加
$(document).ready(pullDown);
document.addEventListener('DOMContentLoaded', pullDown);
document.addEventListener('turbo:load', pullDown);

// Turboの完全リロードに対応
document.addEventListener('turbo:before-cache', removeEventListeners);
