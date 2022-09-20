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