'use strict';

letsdineApp.controller('NewEventController',
    function($scope, Events, $routeParams){
        console.log("WooHoo!");
        $scope.newEvent = function(data){
            var data = {'event': {
                'event_name': $scope.eventName,
                'event_description': $scope.eventDescription,
                'price': $scope.eventPrice
            }};
            console.log(data);
            var newEvent = Events.save(data, function(callbackdata){
                console.log(callbackdata);
                console.log(callbackdata.user_id)
            });
        }

});