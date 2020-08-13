console.log('LOADED THE like tags script');

// const tagsDivs = document.querySelectorAll(".tags");
const postsDivs = document.querySelectorAll(".content")

postsDivs.forEach(postDiv => {
  console.log(postDiv)
  const likeLink = postDiv.querySelector(".like-link")
  const likeTags = postDiv.querySelector(".tags")

  console.log(likeLink)
  console.log(likeTags)

  show_likes(likeLink, likeTags)
})



function show_likes(link, tags){
  console.log('show_likes RAN')
  // const commentBox = document.querySelectorAll(".comment-box");

  link.onclick = () => tags.classList.toggle('tags-active');

}
