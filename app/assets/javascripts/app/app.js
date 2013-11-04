'use strict';

var letsdineApp = angular.module('letsdineApp', ['ngResource']);


letsdineApp.config(function($routeProvider){
    $routeProvider.
        when('/',{
            controller: 'HomeController',
            templateUrl: '/assets/home/home.html'
        }).
        when('/events/new', {
            controller: 'events/NewController',
            templateUrl: '/assets/templates/events/new.html'
        })

});