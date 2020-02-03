const color = document.getElementById('color');
const opacity = document.getElementById('opacity');
const img = document.getElementById('img');
const image = document.getElementById('image');

function changeColor() {
  document.body.style.setProperty('--color', color.value);
}

function changeOpacity() {
  document.body.style.setProperty('--opacity', opacity.value);
}

function changeImg() {
  console.log('img');
  image.classList.toggle('hidden');
}