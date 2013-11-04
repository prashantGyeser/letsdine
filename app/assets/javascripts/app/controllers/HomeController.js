'use strict';

letsdineApp.controller('HomeController',
    function HomeController($scope,$location) {
        $scope.popularEvents = [
            {
                'id': 1,
                'name': 'Some awesome event',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            },
            {
                'id': 2,
                'name': 'Some awesome event 2',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            },
            {
                'id': 3,
                'name': 'Some awesome event 3',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            }
        ];
    });