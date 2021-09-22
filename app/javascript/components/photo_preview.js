const previewImageOnFileSelect = () => {
  const input = document.getElementById('photo-input');
  if (input) {
    input.addEventListener('change', () => {
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  let div = document.getElementById("preview")
  if (input.files) {
    for (var i = 0; i < input.files.length; i++) {
      let file = input.files[i]
      const reader = new FileReader();
      let img = document.createElement('img');
      reader.onload = (event) => {
        img.src = event.currentTarget.result;
      }
      reader.readAsDataURL(file)
      div.appendChild(img);
      div.classList.remove('d-none');
    }
  }
}

export { previewImageOnFileSelect };
