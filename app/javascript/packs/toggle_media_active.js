console.log('toggle_media_active RAN');


const view_comments_tabs = document.querySelectorAll(".media-active-toggler")

view_comments_tabs.forEach( tab => {
  mediaContentDiv = tab.parentNode.parentNode.parentNode.parentNode
  commentDiv = mediaContentDiv.querySelector(".view-comments")

  show_comments(tab, commentDiv)
});


function show_comments(tab, commentDiv){
  console.log('show comments RAN')

  tab.onclick = () => commentDiv.classList.toggle('media-active');

}
