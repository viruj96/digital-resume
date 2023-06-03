var observer = new IntersectionObserver((parent) => {
  for (const el of parent) {
    if (el.isIntersecting) {
      el.target.classList.add('show');
    } else {
      el.target.classList.remove('show');
    }
  }
});
var c = document.querySelectorAll('.hidden');
var d =
  Math.round(
    (10 * (new Date().getTime() - new Date('2021-04').getTime())) /
    (1e3 * 3600 * 24 * 365)
  ) / 10;
var e = document.getElementsByClassName('collapsible');
var f = document.getElementsByClassName('card--project');
for (const _c of c) {
  observer.observe(_c);
}
document.getElementById('it').innerHTML = d == 1 ? `${d} year` : `${d} years`;
for (let _c of e) {
  _c.addEventListener('click', () => {
    let _temp2 = _c.nextElementSibling;
    let _d = _c.querySelector('i');
    _temp2.classList.toggle('content');
    _d.classList.toggle('fa-angles-up');
    _d.classList.toggle('fa-angles-down');
  });
}
for (let _d of f) {
  _d.addEventListener('click', () => _d.querySelector('a').click());
}
