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

const itExp = Math.round(10 * (new Date().getTime() - new Date('2021-04').getTime()) / (1000 * 3600 * 24 * 365)) / 10;

document.getElementById('it').innerHTML = itExp === 1 ? `${itExp} year` : `${itExp} years`;

const collapsible = document.getElementsByClassName('collapsible');
for (let element of collapsible) {
	element.addEventListener('click', () => {
		let content = element.nextElementSibling;
		content.classList.toggle('content');
		let icon = element.querySelector('i');
		icon.classList.toggle('fa-angles-up');
		icon.classList.toggle('fa-angles-down');
	});
};

const projects = document.getElementsByClassName('card--project');
for (let project of projects) {
	project.addEventListener('click', () => {
		project.querySelector('a').click();
	});
};
