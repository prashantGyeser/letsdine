'use strict';

letsdineApp.controller('AuthenticationController',
    function($scope, Session){
        $scope.auth = "Test";//Session.requestCurrentUser();
        /*
        console.log("the value in the auth is error:");
        console.log($scope.auth.error);
        if ($scope.auth)
        {

        }
        else
        {

        };

        $scope.headerLoginTemplate = $scope.auth ? 'templates/authentication/loggedIn.html' : 'templates/authentication/login.html';
        */
    });