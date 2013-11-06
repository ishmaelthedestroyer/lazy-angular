define [
  'app'
], (app) ->
    app.config ($controllerProvider, $compileProvider, $filterProvider, $provide) ->
      app.controller = $controllerProvider.register
      app.directive = $compileProvider.directive
      app.filter = $filterProvider.register
      app.provider = $provide.provider
      app.factory = $provide.factory
      app.service = $provide.service