console.log('member profile following/followers ran');


const followers_button = document.querySelector(".followers-button")
const following_button = document.querySelector(".following-button")

const followers_div = document.querySelector(".followers-div")
const following_div = document.querySelector(".following-div")

console.log(followers_button)
console.log(following_button)
console.log(followers_div)
console.log(following_div)



followers_button.onclick = () => followers_div.classList.toggle('tags-active');
following_button.onclick = () => following_div.classList.toggle('tags-active');
