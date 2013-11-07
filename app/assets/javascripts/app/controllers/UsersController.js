'use strict';

letsdineApp.controller('UsersController',
    function UsersController($scope, Session) {

        // checking if the user is logged in -- start
        console.log(Session.requestCurrentUser());
        $scope.loggedIn = Session.requestCurrentUser();
        console.log($scope.loggedIn);
        // checking if the user is logged in -- end

        $scope.login = function(user) {
            $scope.authError = null;

            Session.login(user.email, user.password)
                .then(function(response) {
                    if (!response) {
                        $scope.authError = 'Credentials are not valid';
                    } else {
                        $scope.authError = 'Success!';
                    }
                }, function(response) {
                    $scope.authError = 'Server offline, please try later';
                });
        };

        $scope.logout = function(user) {

        };

        $scope.register = function(user) {
            $scope.authError = null;

            Session.register(user.email, user.password, user.confirm_password)
                .then(function(response) {
                    console.log(response);
                }, function(response) {
                    var errors = '';
                    $.each(response.data.errors, function(index, value) {
                        errors += index.substr(0,1).toUpperCase()+index.substr(1) + ' ' + value + ''
                    });
                    $scope.authError = errors;
                });
        };

    });