const themeBtn = document.getElementById('theme-toggle');

themeBtn.addEventListener('click', () => {
  themeBtn.classList.toggle('fa-moon');
  themeBtn.classList.toggle('fa-sun');

  if (themeBtn.classList.contains('fa-moon')) {
    document.body.classList.add('light');
    themeBtn.setAttribute('title', 'Dark mode');
    themeBtn.style.padding = '0.5% 0.7%';
  } else {
    document.body.classList.remove('light');
    themeBtn.setAttribute('title', 'Light mode');
    themeBtn.style.padding = '0.5%';
  }
});
