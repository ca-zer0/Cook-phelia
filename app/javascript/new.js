function pullDown() {
  if (window.location.pathname == '/recipes/new') {
  const add = document.getElementById('add');
  const forms = document.querySelector('.forms');

  add.addEventListener('click', function() {
    const clone = forms.cloneNode(true);


    clone.querySelector('#food-name').value = '';
    clone.querySelector('#food-amount').value = '';

    clone.querySelector('#food-name').name = 'foods[][name]';
    clone.querySelector('#food-amount').name = 'foods[][amount]';
    forms.parentNode.appendChild(clone);
  });

  document.addEventListener('click', function(e) {
    if (e.target && e.target.id && e.target.id.includes('food-amount')) {
      add.click();
    }
  });
};
};

$(document).ready(pullDown);