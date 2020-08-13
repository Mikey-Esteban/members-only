console.log('show member liked posts RAN');


const liked_posts_tab = document.querySelector(".liked-posts-tab")
const liked_posts_tags = document.querySelector(".liked-posts-tags")

const followers_tab = document.querySelector(".followers-tab")
const followers_tags = document.querySelector(".followers-tags")

const following_tab = document.querySelector(".following-tab")
const following_tags = document.querySelector(".following-tags")


liked_posts_tab.onclick = () => liked_posts_tags.classList.toggle('tags-active');
followers_tab.onclick = () => followers_tags.classList.toggle('tags-active');
following_tab.onclick = () => following_tags.classList.toggle('tags-active');
