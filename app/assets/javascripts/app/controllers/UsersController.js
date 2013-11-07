'use strict';

letsdineApp.controller('UsersController',
    function UsersController($scope, $log, $http) {

        $scope.login = function() {
            $http.post('../users/sign_in.json', {user: {email: $scope.user.email, password: $scope.user.password}});
        };

        $scope.logout = function() {
            $http({method: 'DELETE', url: '../users/sign_out.json', data: {}});
        };



        /*
        $scope.login = function(user) {
            $scope.authError = null;

            Session.login(user.email, user.password)
                .then(function(response) {
                    if (!response) {
                        $scope.authError = 'Credentials are not valid';
                    } else {
                        $scope.authError = 'Success!';
                        alert("Woo hoo!");
                    }
                }, function(response) {
                    $scope.authError = 'Server offline, please try later';
                });
        };
        */

    });
