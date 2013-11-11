'use strict';

letsdineApp.factory('HostEvents', function($resource, $http){
    //return $resource('/api/events/:id',{id: '@id'});
    /*
    var factory = {};
    var baseUrl = '/api/hosts/:id'
    var events = []
    factory.getEvents = function(){
        $http.get('/api/host/events').
            success(function(data, status){
                alert('Success in the get call');
                events = data;
                return events;
            }).
            error(function(data, status){
                alert('Error in the get call');
            });
    };
    return factory;
    */

    return $resource('/api/host/events', {}, {
        getEvents: { method: 'GET', params: {}, isArray: true }
    });

});

