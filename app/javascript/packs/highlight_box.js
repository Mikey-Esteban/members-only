console.log("highligh box RAN")

const postBox = document.querySelector(".highlight")
// postBox.classList.add('highlight')

postBox.onclick = () => postBox.classList.remove('highlight')
console.log(postBox)
