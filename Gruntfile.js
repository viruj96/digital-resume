module.exports = function(grunt) {
	const message = grunt.options("message");

	grunt.initConfig({
	  bump: {
		options: {
		  files: ['package.json'],
		  updateConfigs: [],
		  commit: true,
		  commitMessage: `${message}`,
		  commitFiles: ['-a'],
		  createTag: true,
		  tagName: 'v%VERSION%',
		  tagMessage: 'Version %VERSION%',
		  push: true,
		  pushTo: 'origin',
		  gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d',
		  globalReplace: false,
		  prereleaseName: false,
		  metadata: '',
		  regExp: false,
		},
	  },
	});
  
	grunt.loadNpmTasks('grunt-bump');
  
	grunt.registerTask('default', ['bump']);
  };
  