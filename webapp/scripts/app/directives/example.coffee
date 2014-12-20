'use strict'

angular.module('webApp')
.directive('user', [
  ->
    restrict: 'E'
    scope:
      user: '=user'
      bgColor: '@'
    template: '<a class="btn btn-user">\
                <span class="profile" style="background-color: {{bgColor}}">{{initials()}}</span> <span ng-if="user.name">{{user.name}}</span>\
                  <span ng-if="!user.name && user.email">{{user.email}}</span>\
              </a>'
    link: (scope, elem, attrs) ->

      scope.initials = ->
        initials = (scope.user.name || scope.user.email).split ' '
        str = ''
        count = 0
        for i in initials
          str += i.charAt(0).toUpperCase()
          ++ count
          if count is 2
            str += '..' if initials.length > 2
            elem.find('.profile').css 'fontSize': '13px'
            break
        str

])