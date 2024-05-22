function addForms() {
  console.log("addForms function called");
  if (window.location.pathname == '/recipes/new') {
  const add = document.getElementById('add');
  const forms = document.querySelector('.new-forms');

  add.addEventListener('click', function() {
    const clone = forms.cloneNode(true);
        clone.querySelector('#food-name').value = '';
        clone.querySelector('#food-amount').value = '';
        clone.querySelector('#food-unit').value = '';

        clone.querySelector('#food-name').name = 'foods[][name]';
        clone.querySelector('#food-amount').name = 'foods[][amount]';
        clone.querySelector('#food-unit').name = 'foods[][unit]';
        forms.parentNode.appendChild(clone);
      });
    
      document.addEventListener('click', function(e) {
        if (e.target && e.target.id && e.target.id.includes('food-unit')) {
          add.click();
        }
      });
    };
  };

  document.querySelector(".new-forms").addEventListener("submit", function(event){
    var name = document.querySelector("#food-name");
    var amount = document.querySelector("#food-amount");
    var unit = document.querySelector("#food-unit");
  
    if(name.value.trim() == ""){
      name.removeAttribute('name');
    }
    if(amount.value.trim() == ""){
      amount.removeAttribute('name');
    }
    if(unit.value.trim() == ""){
      unit.removeAttribute('name');
    }
  });

  $(document).ready(addForms);
  window.addEventListener("turbo:render", addForms);