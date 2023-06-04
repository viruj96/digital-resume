var observer = new IntersectionObserver((parent) => {
  for (const el of parent) {
    if (el.isIntersecting) {
      el.target.classList.add('show');
    } else {
      el.target.classList.remove('show');
    }
  }
});

var hidden = document.querySelectorAll('.hidden');

var itExp =
  Math.round(
    (10 * (new Date().getTime() - new Date('2021-04').getTime())) /
    (1e3 * 3600 * 24 * 365)
  ) / 10;

var collapsible = document.getElementsByClassName('collapsible');
var projects = document.getElementsByClassName('card--project');

for (const el of hidden) {
  observer.observe(el);
}

document.getElementById('it').innerHTML = itExp == 1 ? `${itExp} year` : `${itExp} years`;

for (let el of collapsible) {
  el.addEventListener('click', () => {
    let sibling = el.nextElementSibling;
    let icon = el.querySelector('i');
    sibling.classList.toggle('content');
    icon.classList.toggle('fa-angles-up');
    icon.classList.toggle('fa-angles-down');
  });
}

for (let el of projects) {
  el.addEventListener('click', () => el.querySelector('a').click());
}
