function pullDown() {
  const pullDownButton = document.getElementById("lists");
  const pullDownLists = document.getElementById('btn');
  const imgTag = document.querySelector('.user-btn');
  const originalSrc = imgTag.getAttribute('src');
  const pullDownParents = document.getElementById("pull-down");
  const pullDownList = document.getElementById("down-lists");
  const search = document.getElementById('search-btn');
  const shopping = document.getElementById('shopping-btn')
  const userEdit = document.getElementById('user-edit')
  const userOut = document.getElementById('user-out')

  imgTag.addEventListener('mouseover', function() {
    this.setAttribute('src', '/assets/user2.jpg');
  });

  imgTag.addEventListener('mouseout', function() {
    this.setAttribute('src', originalSrc);
  });

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  });

  pullDownLists.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#155791;")
  });

  pullDownLists.addEventListener('mouseout', function(){
    this.removeAttribute("style")
  });

  pullDownLists.addEventListener('click', function() {
    if (pullDownList.getAttribute("style") == "display:block;") {
      pullDownList.removeAttribute("style");
  
      var items = document.getElementsByClassName('form-items');
      for (var i = 0; i < items.length; i++) {
        items[i].style.display = 'none';
      }
  
    } else {
      pullDownList.setAttribute("style", "display:block;");
    }
  });

  search.addEventListener('mouseover', function() {
    search.style.fontWeight = "bold";
});

search.addEventListener('mouseout', function() {
    search.style.fontWeight = "normal";
});

  search.addEventListener('click', function() {
    var items = document.getElementsByClassName('form-items');
    for (var i = 0; i < items.length; i++) {
      if (items[i].style.display === 'none' || items[i].style.display === '') {
        items[i].style.display = 'block';
      } else {
        items[i].style.display = 'none';
      }
    }
  });

  shopping.addEventListener('mouseover', function() {
    shopping.style.fontWeight = "bold";
  });
  
  shopping.addEventListener('mouseout', function() {
    shopping.style.fontWeight = "normal";
  });

  userEdit.addEventListener('mouseover', function() {
    userEdit.style.fontWeight = "bold";
  });
  
  userEdit.addEventListener('mouseout', function() {
    userEdit.style.fontWeight = "normal";
  });

  userOut.addEventListener('mouseover', function() {
    userOut.style.fontWeight = "bold";
  });
  
  userOut.addEventListener('mouseout', function() {
    userOut.style.fontWeight = "normal";
  });

};

$(document).ready(pullDown);