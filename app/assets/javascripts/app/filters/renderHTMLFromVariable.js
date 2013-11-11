'use strict';

letsdineApp.filter('renderhtml', function($sce){
    return function (value) {
        //var html = converter.makeHtml(value || '');
        return $sce.trustAsHtml(value);
    };
});