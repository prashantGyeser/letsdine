'use strict';

letsdineApp.controller('EventsController',
    function($scope, Events){
        $scope.events = Events.query();
        console.log("The value in the events is:" + $scope.events)

});