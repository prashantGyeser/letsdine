'use strict';

letsdineApp.factory('Session', function($location, $http, $q) {
    var urlBase = '/login';
    var Session = {};

    Session.getCustomer = function (id) {
        return $http.get(urlBase + '/' + id);
    };

    Session.login = function (email,password) {
        //return $http.post(urlBase, user);
        var promise = $http.post(urlBase, {user: {email: email, password: password} }).
            success(function(data, status, headers, config){
                //TODO: Send them back to where they came from
                //$location.path(response.data.redirect);
            }).
            error(function(data, status, headers, config){
                //TODO: Handle this error in some way

            });
        return promise;
    };

    Session.updateCustomer = function (cust) {
        return $http.put(urlBase + '/' + cust.ID, cust)
    };

    Session.deleteCustomer = function (id) {
        return $http.delete(urlBase + '/' + id);
    };

    Session.getOrders = function (id) {
        return $http.get(urlBase + '/' + id + '/orders');
    };

    return Session;

});