var a = document.getElementById('theme-toggle');
a.addEventListener('click', () => {
  a.classList.toggle('fa-moon');
  a.classList.toggle('fa-sun');
  if (a.classList.contains('fa-moon')) {
    document.body.classList.add('light');
    a.setAttribute('title', 'Dark mode');
    a.style.padding = '0.5% 0.7%';
  } else {
    document.body.classList.remove('light');
    a.setAttribute('title', 'Light mode');
    a.style.padding = '0.5%';
  }
});
