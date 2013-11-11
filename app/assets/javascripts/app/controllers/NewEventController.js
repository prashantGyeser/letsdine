'use strict';

letsdineApp.controller('NewEventController',
    function($scope, Events, $routeParams, $location){

        // Google maps venue picker -- start
        angular.extend($scope, {

            position: {
                coords: {
                    latitude: 45,
                    longitude: -73
                }
            },

            /** the initial center of the map */
            centerProperty: {
                //latitude: 45,
                //longitude: -73
                latitude: 45,
                longitude: -73
            },

            /** the initial zoom level of the map */
            zoomProperty: 8,

            /** list of markers to put in the map */
            markersProperty: [ {
                latitude: 45,
                longitude: -74
            }],

            // These 2 properties will be set when clicking on the map
            clickedLatitudeProperty: null,
            clickedLongitudeProperty: null,

            eventsProperty: {
                click: function (mapModel, eventName, originalEventArgs) {
                    // 'this' is the directive's scope
                    $log.log("user defined event on map directive with scope", this);
                    $log.log("user defined event: " + eventName, mapModel, originalEventArgs);
                }
            }
        });
        // Google maps venue picker -- end


        // Picture uploader -- start
        $scope.uploadFiles = function(){
            filepicker.pickMultiple({mimetype:'image/*'},{},function(files){console.log(files)},function(err){console.log(err)});
        };
        // Picture uploader -- end

        $scope.newEvent = function(data){

            var data = {'event': {
                'event_name': $scope.eventName,
                'event_description': $scope.eventDescription,
                'price': $scope.eventPrice,
                'event_date': $scope.eventDate
            }};
            console.log(data);
            // Todo: Show an animation while the form is being sent and the event is being created. Otherwise it looks like nothing is happening when the button is clicked.
            var newEvent = Events.save(data, function(callbackdata){
                console.log("The callback is" + callbackdata);
                console.log("The callback event is" + callbackdata.event);
                //var newEventCreated = callbackdata;
                //console.log(callbackdata.user_id)
                $location.path('/events/' + callbackdata.id );
            });
        }

});