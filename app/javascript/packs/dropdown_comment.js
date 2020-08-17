console.log('dropdown comment RAN');

const commentBox = document.querySelectorAll(".comment-box");
commentBox.forEach( box => dropdown_comment(box));


function dropdown_comment(param){

  const trigger = param.querySelector(".dropdown-trigger");
  const button = trigger.querySelector(".comment-button")

  console.log(param)


  button.onclick = () => {
    console.log('pressed view comments')
    param.classList.toggle('is-active')
  };
}
