'use strict';

letsdineApp.controller('EventsController',
    function($scope, Events, $routeParams){
        $scope.event = Events.get({id: $routeParams.id});

});