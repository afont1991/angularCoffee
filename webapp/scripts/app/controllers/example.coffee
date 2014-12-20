'use strict'

webApp.controller 'LoginController', [
  '$scope'
  '$rootScope'
  '$state'
  ($scope, $rootScope, $state) ->
    $scope.init = ->
      if $rootScope.login
        $state.go 'dashboard'
      $rootScope.pageTitle = 'Login'

    $scope.init()
]
