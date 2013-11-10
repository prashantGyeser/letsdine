'use strict';

var getCurrentUserLoadDataController = letsdineApp.controller('getCurrentUserLoadDataController', function($scope, Session){

         function getCurrentUser(User, $q) {
             // see: https://groups.google.com/forum/?fromgroups=#!topic/angular/DGf7yyD4Oc4
             var deferred = $q.defer();
             Session.requestCurrentUser().then(function(response){
             deferred.resolve(response);
         });
         return deferred.promise;

         },
         delay: function($q, $defer) {
         var delay = $q.defer();
         $defer(delay.resolve, 1000);
         return delay.promise;
         }

});