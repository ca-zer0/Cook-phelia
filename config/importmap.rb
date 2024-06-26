# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "new", to: "new.js"
pin "addlist", to: "addlist.js"
pin "delete", to: "delete.js"
pin "header", to: "header.js"
pin "modal", to: "modal_window.js"
pin "checkbox", to: "checkbox.js"