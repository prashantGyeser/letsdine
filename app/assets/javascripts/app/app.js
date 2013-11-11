'use strict';

var login = angular.module('myLoginCheck', ['ui.date']).
    factory('$loginCheck', function($http,$rootScope){
       return function(){
           $http.get('/current_user').
               success(function(data, status, header){
                   if(status === 200){
                       console.log("IT is here 3");
                       $rootScope.currentUser = data.user;
                       $rootScope.isLoggedIn = true
                       return true;
                   }
                   else{
                        return false;
                   }
               }).
               error(function(data, status, header){
                   return false;
               });
       }
    });

var letsdineApp = angular.module('letsdineApp', [
    'ngRoute',
    'ngResource',
    'ngAnimate',
    "google-maps",
    'ngCookies',
    'myLoginCheck',
    'ngSanitize'
    //'autoGrow'
]);



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

letsdineApp.run(function($loginCheck, $location){
    console.log("Checking the statu" + $loginCheck());
});

/*
letsdineApp.run(function($cookies, $http, $cookieStore){

    $cookieStore.remove('isLoggedin');
    $cookieStore.remove('currentUser');

    var current_user_in_app = $http.get('/current_user').
        success(function(data, status, header){

            if(status === 200){
                $cookieStore.put['isLoggedin', true];
                $cookieStore.put['currentUser', data.user];
                //$cookies['isLoggedin'] = true;
                //$cookies['currentUser']= data.user;
                console.log($cookieStore.put('currentUser'))

            }
            else{
                $cookieStore.put['isLoggedin', true];
            }
        }).
        error(function(data, status, header){
            console.log("It is getting intop the error function in the app.js file");
        });

});
*/

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
        when('/events/new', {
            controller: 'NewEventController',
            templateUrl: '/assets/events/new.html'
        }).
        when('/hosts/:id/manage', {
            controller:'HostAdminController',
            templateUrl:'/assets/hosts/manage.html'
        })


});