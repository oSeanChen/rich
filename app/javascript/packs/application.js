// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 全站都會執行
// document.addEventListener("DOMContentLoaded", () => {
//   const likeBtn = document.querySelector("#likeBtn")
//   likeBtn.addEventListener("click", () => {
//     console.log(123);
//   })
// })
import "controllers"
