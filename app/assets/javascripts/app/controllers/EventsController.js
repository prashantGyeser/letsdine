'use strict';

letsdineApp.controller('EventsController',
    function($scope, Events){
        $scope.events = Events.query(function(){
            //Good code goes here
                console.log("IT is getting to the good part");
            }, function(response){
                // 404 or bar code goes here
                console.log("Something went wrong!!!!");
                console.log("the error is:" + response);
            }

        )
        console.log("The value in the events is:" + $scope.events);

/*
        $scope.word = Word.get({ id : $routeParams.id }, function() {
            //good code
        }, function(response) {
            //404 or bad
            if(response.status === 404) {
            }
        });
*/
});