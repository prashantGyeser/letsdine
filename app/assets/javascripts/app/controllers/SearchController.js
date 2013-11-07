'use strict';

letsdineApp.controller('SearchController',
    function SearchController($scope, AlgoliaSearch){
        $scope.indexes = AlgoliaSearch.query();
});