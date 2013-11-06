'use strict';

letsdineApp.controller('SearchController',
    function SearchController($scope, ejsResource){
        var ejs = ejsResource('http://localhost:9200');
        var index = 'twitter';
        var statusRequest = ejs.Request()
            .indices(index)
            .types('status');
        $scope.resultsArr = [];

        $scope.search = function() {
            $scope.resultsArr = [];
            var results = statusRequest
                .query(ejs.MatchQuery('_all', $scope.queryTerm))
                .fields(['text', 'user', 'created_at'])
                .doSearch();
            $scope.resultsArr.push(results);
        };
});