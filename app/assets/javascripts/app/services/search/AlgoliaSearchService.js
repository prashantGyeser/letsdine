'use strict';

letsdineApp.factory('AlgoliaSearch', function($resource){
    var AlgoliaSearch = $resource('https://BWLDN6WW7T.algolia.io/1/indexes');
    return AlgoliaSearch;
});
