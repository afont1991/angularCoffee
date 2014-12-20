'use strict'

module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      tmp: ['.tmp']
      dist: ['dist']

    coffee:
      options:
        join: true
      compile:
        files:
          '.tmp/concat/assets/js/app.js': [
            'webapp/scripts/app/**/*.coffee'
          ]

    coffeelint:
      options:
        configFile: '.coffeelintrc'
      webapp: ['webapp/scripts/**/*.coffee']
      server: ['server/**/*.coffee', 'server.coffee']
      gruntfile: ['Gruntfile.coffee']

    less:
      options:
        paths: ['webapp/styles/less/app', 'bower_components/bootstrap/less']
      webapp:
        files:
          'webapp/styles/app.css': 'webapp/styles/less/app/app.less'

    copy:
      'application-layout':
        src: 'views/templates/app/layout.html'
        dest: 'dist/application_layout.html'
      images:
        src: '**'
        cwd: 'webapp/images/'
        dest: 'dist/assets/images/'
        nonull: true
        expand: true
      fonts:
        src: '**'
        cwd: 'bower_components/font-awesome/fonts/'
        dest: 'dist/assets/fonts/'
        nonull: true
        expand: true
      vendorFiles:
        files: [
          src: '.tmp/concat/assets/js/vendorApp.js'
          dest: 'dist/assets/js/vendorApp.js'
        ]
      appFiles:
        files: [
          src: '.tmp/concat/assets/js/app.js'
          dest: 'dist/assets/js/app.js'
        ]

    useminPrepare:
      application:
        src: 'dist/application_layout.html'

    usemin:
      'application-layout-css':
        options:
          assetDirs: ['views']
          type: 'css'
        files:
          src:  'dist/application_layout.html'

    watch:
      webapp:
        files: ['webapp/**/*.coffee', 'views/templates/**/layout.html', 'webapp/styles/less/**/*.less', 'webapp/styles/!(app.css)*.css']
        tasks: ['build']
      server:
        files: ['server/**/*.coffee']


  grunt.registerTask 'build', 'Builds the Front end assets', ->
    env = process.env.NODE_ENV
    grunt.task.run 'clean'
    grunt.task.run 'copy'
    grunt.task.run 'coffeelint'
    grunt.task.run 'coffee'
    grunt.task.run 'less:webapp'
    grunt.task.run 'useminPrepare'
    grunt.task.run 'concat'
    grunt.task.run 'cssmin'

    if env and env isnt 'local'
      grunt.task.run 'uglify:generated'
    else
      grunt.task.run 'copy:vendorFiles'

    grunt.task.run 'usemin'
    grunt.task.run 'copy:appFiles'

