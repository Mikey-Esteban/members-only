console.log("toggle_modal RAN")

const toggle_button = document.querySelector(".modal-button");
const delete_buttons = document.querySelectorAll(".modal-delete");
const modal_div = document.querySelector(".modal");

toggle_button.onclick = () => modal_div.classList.toggle('is-active');

delete_buttons.forEach( function(delete_button) {
  delete_button.onclick = () => modal_div.classList.toggle('is-active');
})
