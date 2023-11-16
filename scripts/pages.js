const pages = {
	git: {
		title: "GitBatchClone",
		class: [
			"fa-brands",
			"fa-github"
		]
	},
	portfolio: {
		title: "GitBatchClone",
		class: [
			"fa-solid",
			"fa-book-bookmark"
		]
	},
	football: {
		title: "Arbitrage Betting Analyzer",
		class: [
			"fa-solid",
			"fa-futbol"
		]
	},
	terminalsite: {
		title: "Terminal-themed Portfolio",
		class: [
			"fa-solid",
			"fa-terminal"
		]
	},
	masters: {
		title: "Mater's Thesis",
		class: [
			"fa-solid",
			"fa-grip-lines"
		]
	},
	wr: {
		title: "Digitizing Workflow",
		class: [
			"fa-solid",
			"fa-computer"
		]
	},
	bachelors: {
		title: "Bachelor's Thesis",
		class: [
			"fa-solid",
			"fa-brain"
		]
	},
	warman: {
		title: "Warman Competition",
		class: [
			"fa-solid",
			"fa-robot"
		]
	},
	poem: {
		title: "Poem",
		class: [
			"fa-solid",
			"fa-scroll"
		]
	}
};

const filename = window.location.pathname.split('/')[2].split('.')[0];

const projectNavigator = document.getElementById('pages');

const h4 = document.createElement('h4');
h4.innerText = "Curious about my other projects:";

projectNavigator.appendChild(h4);

const btns = document.createElement('div');
btns.classList.add('navigation-btns');

const keys = Object.keys(pages);
for (let key of keys) {
	if (key !== filename) {
		const a = document.createElement('a');
		const page = pages[key];
		a.href = `${key}.html`;
		a.title = page.title;
		const i = document.createElement('i');
		i.classList.add(...page.class);
		a.appendChild(i);
		btns.appendChild(a);
	}
}

projectNavigator.appendChild(btns);
