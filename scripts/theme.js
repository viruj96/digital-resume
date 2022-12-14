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