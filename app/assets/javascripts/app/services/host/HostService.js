'use strict';

letsdineApp.factory('Events', function($resource){
    return $resource('/api/events/:id',{id: '@id'});
});

