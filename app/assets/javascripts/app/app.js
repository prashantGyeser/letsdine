'use strict';

var letsdineApp = angular.module('letsdineApp', ['ngResource']);

// Config for signin
letsdineApp.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

    var interceptor = ['$location', '$rootScope', '$q', function($location, $rootScope, $q) {
        function success(response) {
            return response
        };

        function error(response) {
            if (response.status == 401) {
                $rootScope.$broadcast('event:unauthorized');
                $location.path('/users/login');
                return response;
            };
            return $q.reject(response);
        };

        return function(promise) {
            return promise.then(success, error);
        };
    }];
    $httpProvider.responseInterceptors.push(interceptor);
}]);

// Routes
letsdineApp.config(function($routeProvider){
    $routeProvider.
        when('/',{
            controller: 'HomeController',
            templateUrl: '/assets/home/home.html'
        }).
        when('/events/new', {
            controller: 'events/NewController',
            templateUrl: '/assets/events/new.html'
        }).
        when('/users/login', {
            controller: 'UsersController',
            templateUrl: '/assets/users/login.html'
        }).
        when('/users/register', {
            controller: 'users/UsersController',
            templateUrl: '/assets/users/register.html'
        })
});