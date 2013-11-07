'use strict';

letsdineApp.controller('UsersController',
    function UsersController($scope, Session, $log) {

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

    });
