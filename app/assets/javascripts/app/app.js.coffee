#= require_self
#= require_tree ./directives/
#= require_tree ./controllers/
#= require_tree ./resources/

Riddlr = angular.module 'riddlr', [
    'ngResource'
    'app.controllers'
    'app.directives'
    'app.resources'
    'ui.ace'
  ]

angular.module 'app.controllers', []
angular.module 'app.directives', []
angular.module 'app.resources', ['ngResource']

Riddlr.config [
  '$httpProvider'
  '$locationProvider'
  '$routeProvider'

($httpProvider, $locationProvider, $routeProvider) ->
  # Rails requires provisioning a csrf-token in order to prevent CSRF
  # More info at http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf
  token = $("meta[name='csrf-token']").attr("content")
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = token

  $locationProvider.html5Mode(true).hashPrefix('!')

  $routeProvider.
    when('/quizzes/:id'
      template: JST['quizzes/show']()
      controller: 'QuizzesCtrl'
    ).
    when('/'
      template: JST['homepage/show']()
      controller: 'HomepageCtrl'
    ).
    otherwise
      redirectTo: '/'
]
