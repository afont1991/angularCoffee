'use strict'

webApp.controller 'NavController', [
  '$scope'
  '$rootScope'
  '$state'
  ($scope, $rootScope, $state) ->
    $scope.init = ->
      console.log 'init'
    $scope.init()
]
