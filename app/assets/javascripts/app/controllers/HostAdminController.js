'use strict';

letsdineApp.controller('HostAdminController',
    function($scope){
        $scope.events = [
            {
                'id': 1,
                'name': 'Some awesome event',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone',
                'attendees': 5
            },
            {
                'id': 2,
                'name': 'Some awesome event 2',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone',
                'attendees': 34
            },
            {
                'id': 3,
                'name': 'Some awesome event 3',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone',
                'attendees': 10
            }
        ];


    });