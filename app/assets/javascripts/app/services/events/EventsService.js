'use strict';

letsdineApp.factory('Events', function($resource){
    return $resource('/events/:id', {id: '@id'});
})