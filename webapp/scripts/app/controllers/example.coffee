'use strict'

webApp.controller 'MainController', [
  '$scope'
  '$rootScope'
  '$state'
  ($scope, $rootScope, $state) ->
    $scope.init = ->
      console.log '==========='

    $scope.init()
]
