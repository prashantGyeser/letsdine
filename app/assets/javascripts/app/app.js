'use strict';

var letsdineApp = angular.module('letsdineApp', [
    'ngRoute',
    'ngResource',
    'ngAnimate'
]);

// Showing a spinner while the content is loading -- start
letsdineApp.config(function ($httpProvider) {
    $httpProvider.responseInterceptors.push('myHttpInterceptor');
    var spinnerFunction = function (data, headersGetter) {
        // todo start the spinner here
        $('#loading').show();
        return data;
    };
    $httpProvider.defaults.transformRequest.push(spinnerFunction);
});
// register the interceptor as a service, intercepts ALL angular ajax http calls
letsdineApp.factory('myHttpInterceptor', function ($q, $window) {
    return function (promise) {
        return promise.then(function (response) {
            // do something on success
            // todo hide the spinner
            $('#loading').hide();
            return response;

        }, function (response) {
            // do something on error
            // todo hide the spinner
            $('#loading').hide();
            return $q.reject(response);
        });
    };
});
// Showing a spinner while the content is loading -- end

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