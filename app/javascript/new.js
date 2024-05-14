window.onload = function() {
  var add = document.getElementById('add');
  add.addEventListener('click', function() {
    var forms = document.querySelector('.forms');
    var clone = forms.cloneNode(true);

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

  pullDown();
}