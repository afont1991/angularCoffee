'use strict'

webApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$locationProvider'
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
    .state('login', {
      url: '/'
      views:
        appView:
          templateUrl: '/templates/app/login.html'
    })

    $locationProvider.html5Mode true
]