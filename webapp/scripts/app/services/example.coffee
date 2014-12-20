'use strict'

angular.module('webApp')
.service 'BillingService', [
  '$q'
  '$http'
  ($q, $http) ->

    @getBillingInfo = (userId) ->
      deferred = $q.defer()
      $http(
        url: "/api/v1/users/#{userId}/billing"
        method: 'get'
      )
      .success((response) ->
        deferred.resolve response
      )
      .error (err) ->
        deferred.reject err

      deferred.promise

    @saveCreditCardInfo = (userId, creditCardInfo) ->
      deferred = $q.defer()
      $http(
        url: "/api/v1/users/#{userId}/creditCard"
        method: 'PUT'
        data:
          creditCardInfo: creditCardInfo
      )
      .success((response) ->
        deferred.resolve response
      )
      .error (err) ->
        deferred.reject err

      deferred.promise

    @saveBillingInfo = (userId, billingInfo) ->
      deferred = $q.defer()
      $http(
        url: "/api/v1/users/#{userId}/billing"
        method: 'PUT'
        data:
          billingInfo: billingInfo
      )
      .success((response) ->
        deferred.resolve response
      )
      .error (err) ->
        deferred.reject err

      deferred.promise
    return
]