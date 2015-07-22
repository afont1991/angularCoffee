'use strict'

webApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$locationProvider'
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
    .state('main', {
      url: '/'
      views:
        appView:
          templateUrl: '/templates/app/main.html'
    })
    .state('what-is-the-bosco', {
      url: '/what-is-the-bosco'
      views:
        appView:
          templateUrl: '/templates/app/what-is-the-bosco.html'
    })
    .state('photos', {
      url: '/photos'
      views:
        appView:
          templateUrl: '/templates/app/photos.html'
    })
    .state('get-the-bosco', {
      url: '/get-the-bosco'
      views:
        appView:
          templateUrl: '/templates/app/get-the-bosco.html'
    })
    .state('jobs', {
      url: '/jobs'
      views:
        appView:
          templateUrl: '/templates/app/jobs.html'
    })
    .state('team', {
      url: '/team'
      views:
        appView:
          templateUrl: '/templates/app/team.html'
    })
    .state('contact', {
      url: '/contact'
      views:
        appView:
          templateUrl: '/templates/app/contact.html'
    })
    .state('terms', {
      url: '/terms'
      views:
        appView:
          templateUrl: '/templates/app/terms.html'
    })

    $locationProvider.html5Mode true
]