// console.log("follow tag RAN")

const follow_tags = document.querySelectorAll(".follow-tag")

follow_tags.forEach((follow_tag) => {
  // console.log(follow_tag)
  follow_tag.onclick = () => {
    if ( follow_tag.classList.contains('is-light') ) {
      follow_tag.classList.toggle('is-light')
      follow_tag.classList.toggle('is-primary')
      follow_tag.classList.toggle('is-outlined')
      follow_tag.classList.toggle('following')
      follow_tag.innerHTML = 'following'
      media_left_div = follow_tag.parentNode.parentNode.parentNode
      media_left_div.classList.toggle('button-is-following')
      media_left_div.classList.toggle('button-not-following')
    }
    else {
      follow_tag.classList.toggle('is-light')
      follow_tag.classList.toggle('is-primary')
      follow_tag.classList.toggle('is-outlined')
      follow_tag.classList.toggle('following')
      follow_tag.innerHTML = 'follow'
      follow_tag_div = follow_tag.parentNode
      media_left_div = follow_tag.parentNode.parentNode.parentNode
      media_left_div.classList.toggle('button-is-following')
      media_left_div.classList.toggle('button-not-following')
    }
  }
});
