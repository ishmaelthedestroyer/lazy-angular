// Generated by CoffeeScript 1.4.0
(function() {

  define(['app'], function(app) {
    return app.config(function($controllerProvider, $compileProvider, $filterProvider, $provide) {
      app.controller = $controllerProvider.register;
      app.directive = $compileProvider.directive;
      app.filter = $filterProvider.register;
      app.provider = $provide.provider;
      app.factory = $provide.factory;
      return app.service = $provide.service;
    });
  });

}).call(this);
