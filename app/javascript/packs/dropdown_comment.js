console.log('LOADED THE dropdown script');

const commentBox = document.querySelectorAll(".comment-box");
commentBox.forEach( box => dropdown_comment(box));


function dropdown_comment(param){
  console.log('dropdown_comment RAN')
  // const commentBox = document.querySelectorAll(".comment-box");
  const trigger = param.querySelector(".dropdown-trigger");
  const button = trigger.querySelector(".comment-button")

  console.log(param)

  button.onclick = () => param.classList.toggle('is-active');
  
}
