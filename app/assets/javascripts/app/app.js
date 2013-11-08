'use strict';

var letsdineApp = angular.module('letsdineApp', [
    'ngRoute',
    'ngResource',
    'ngAnimate'
]);



// Config for signin

letsdineApp.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
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
        }).
        when('/search', {
            controller: 'SearchController',
            templateUrl: '/assets/search/search.html'
        }).
        when('/events', {
            controller: 'EventsController',
            templateUrl: '/assets/events/list.html'
        }).
        when('/events/:id', {
            controller: 'EventsController',
            templateUrl: '/assets/events/show.html'
        }).
        when('/record', {templateUrl:'/record/index.html', controller:RecordCtrl})

});