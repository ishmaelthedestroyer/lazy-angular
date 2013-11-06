define [
], () ->
  (dependencies) ->
    ['$q', '$rootScope', ($q, $rootScope) ->
      deferred = $q.defer()

      require dependencies, () ->
        initialized = true
        $rootScope.$apply () ->
          deferred.resolve()

      deferred.promise
    ]