'use strict';

letsdineApp.factory('Events', function($resource){
    return $resource('/api/events/:id',{id: '@id'}, {
        query: {method:'GET', isArray: true},
        save: {method:'POST', isArray:false}
    });
});

