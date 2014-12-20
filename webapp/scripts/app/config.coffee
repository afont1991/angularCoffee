'use strict'

webApp.run [
  '$rootScope'
  '$state'
  ($rootScope, $state) ->

    $rootScope.pageTitle = 'Angular-Coffee'
]