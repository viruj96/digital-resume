const observer = new IntersectionObserver((entries) => {
	entries.forEach((entry) => {
		if (entry.isIntersecting) {
			entry.target.classList.add('show');
		} else {
			entry.target.classList.remove('show');
		}
	})
});

const sections = document.querySelectorAll('.hidden');
sections.forEach((el) => observer.observe(el));

const IT_EXP = Math.round(10 * (new Date().getTime() - new Date('2021-04').getTime()) / (1000 * 3600 * 24 * 365)) / 10;
let expYears = IT_EXP === 1 ? `${IT_EXP} year` : `${IT_EXP} years`;

document.getElementById('it').innerHTML = expYears;

const theme = document.getElementById('theme-toggle');
theme.addEventListener('click', () => {
	theme.classList.toggle('fa-moon');
	theme.classList.toggle('fa-sun');

	if (theme.classList.contains('fa-moon')) {
		document.body.classList.add('light');
		theme.setAttribute('title', 'Dark mode');
		theme.style.padding = '0.5% 0.7%';
	}
	else {
		document.body.classList.remove('light');
		theme.setAttribute('title', 'Light mode');
		theme.style.padding = '0.5%';
	}
});