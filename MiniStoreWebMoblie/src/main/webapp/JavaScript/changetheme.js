// Set default theme based on time of day
function setDefaultTheme() {
  var date = new Date();
  var hour = date.getHours();
  var section = document.querySelector('section');
  if (hour >= 19 || hour < 6) { // Night time between 7pm and 5:59am
    section.classList.add("night");
  }
}

// Khôi phục theme đã lưu
function restoreTheme() {
  var section = document.querySelector('section');
  var savedTheme = localStorage.getItem('currentTheme');
  if (savedTheme === "night") {
    section.classList.add("night");
  } else {
    section.classList.remove("night");
  }
}

// Lưu theme khi thay đổi
function saveTheme() {
  var section = document.querySelector('section');
  var currentTheme = section.classList.contains('night') ? 'night' : '';
  localStorage.setItem('currentTheme', currentTheme);
}

// Thay đổi theme và lưu
function toggleTheme() {
  var section = document.querySelector('section');
  section.classList.toggle('night');
  saveTheme();
}

document.addEventListener('DOMContentLoaded', function () {
  restoreTheme();
});
