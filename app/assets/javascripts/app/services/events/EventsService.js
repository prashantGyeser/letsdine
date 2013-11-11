'use strict';

letsdineApp.factory('Events', function($resource){
    return $resource('/api/events/:id',{id: '@id'}, {
        query: {method:'GET', isArray: false},
        save: {method:'POST', isArray:false}
    });
});

