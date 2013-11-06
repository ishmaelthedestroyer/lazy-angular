#Lazy Angular

This plugin converts AngularJs modules into lazy-loading components. A dependency resolver script is also provided that takes an array of paths and asynchronously loads the scripts.

This is implementation is based on <a href='http://ify.io/lazy-loading-in-angularjs/'>this blog's method.</a> The ways in which this plugin are improved are subtle but important.

In the setupLazy* script, instead of defining a variable calling the module using the Angular object, a reference to the module should be passed via another script. If the former method is performed, the module is overwritten and its config function won't work. This issue is described <a href='http://stackoverflow.com/questions/15877925/angular-module-config-not-called'> here on this Stackoverflow post.</a>

The dependency resolver script is also rewritten as a function to work with ui-router. Instead of passing it directly to a route's resolve object, it should be set as a key. The dependencies are still asynchronously called, but now other dependencies can be instantiated. This could be used with an authentication script, like <a href='https://github.com/ishmaelthedestroyer/uiAuth'>my uiAuth session + authentication plugin.</a>

And best of all, it's in Coffeescript!

##Usage (Coffeescript)

`app.js`
<pre>
define [
  'angular'
], (angular) ->
  'use strict'
  app = angular.module 'App', []
  angular.bootstrap document, 'App'

  return app
</pre>

`setupLazy.js`
define [
    'app'
], (app) ->
    # ... setupLazy configures app here

`app-routes.js`
<pre>
define [
    'app'
    'dependencyResolver'
], (app) ->
  app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $stateProvider.state 'some-route',
        url: '/some-route'
        templateUrl: '/path/to/some-route.html'
        resolve:
            dependencies: dependencyResolver [
                '/path/to/dependency-1.js'
                '/path/to/dependency-2.js'
            ]

</pre>

##Notes
Developed by <a href='http://twitter.com/ishmaelsalive'>Ishmael tD</a>. <br />

Feedback, suggestions? Tweet me <a href='http://twitter.com/ishmaelsalive'>@IshmaelsAlive</a>. <br />
Need some personal help? Email me @ <a href='mailto:ishmaelthedestroyer@gmail.com?Subject=LazyAngular'>ishmaelthedestroyer@gmail.com</a>