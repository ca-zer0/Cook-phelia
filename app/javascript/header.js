function pullDown() {
  const pullDownButton = document.getElementById("lists")
  const pullDownLists = document.getElementById('btn')
  const imgTag = document.querySelector('.user-btn');
  const originalSrc = imgTag.getAttribute('src');
  const pullDownParents = document.getElementById("pull-down");
  const pullDownList = document.getElementById("down-lists");

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
  })

  pullDownLists.addEventListener('mouseout', function(){
    this.removeAttribute("style")
  })

  pullDownLists.addEventListener('click', function() {
    if (pullDownList.getAttribute("style") == "display:block;") {
      pullDownList.removeAttribute("style");
    } else {
      pullDownList.setAttribute("style", "display:block;");
    }
  });
};

$(document).ready(pullDown);