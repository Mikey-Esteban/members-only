console.log('LOADED THE like comments script');

// const tagsDivs = document.querySelectorAll(".tags");
const postsDivs = document.querySelectorAll(".content")

postsDivs.forEach( function(postDiv) {
  const commentLink = postDiv.querySelector(".comment-link")
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
