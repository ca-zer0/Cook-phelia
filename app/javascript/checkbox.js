function checkbox() {
  document.querySelectorAll('.myCheckbox').forEach((checkbox) => {
    // 既存のチェック状態をロードする
    let storageKey = checkbox.id;
    let storedValue = localStorage.getItem(storageKey);
    if (storedValue === "true") {
      checkbox.checked = true;
    }

    let text = checkbox.nextElementSibling;
    if (checkbox.checked) {
      text.style.color = "gray";
      text.style.textDecoration = "line-through";
    }

    checkbox.addEventListener('change', (event) => {
      const text = checkbox.nextElementSibling;      
      if (checkbox.checked) {
        text.style.color = "gray";
        text.style.textDecoration = "line-through";
        // チェック状態をローカルストレージに保存する
        localStorage.setItem(storageKey, true);
      } else {
        text.style.color = "black";
        text.style.textDecoration = "none";
        // チェック状態をローカルストレージに保存する
        localStorage.setItem(storageKey, false);
      }
    });
  });
};

$(document).ready(checkbox);
window.addEventListener("turbo:render", checkbox);