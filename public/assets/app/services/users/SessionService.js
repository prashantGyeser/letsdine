letsdineApp.factory("Session",function($location,$http,$q){function redirect(url){url=url||"/",$location.path(url)}var service={login:function(email,password){return $http.post("/login",{user:{email:email,password:password}}).then(function(response){service.currentUser=response.data.user,service.isAuthenticated()&&$location.path("/record")})},logout:function(redirectTo){$http.post("/logout").then(function(){service.currentUser=null,redirect(redirectTo)})},register:function(email,password,confirm_password){return $http.post("/users.json",{user:{email:email,password:password,password_confirmation:confirm_password}}).then(function(response){service.currentUser=response.data,service.isAuthenticated()&&$location.path("/record")})},requestCurrentUser:function(){return service.isAuthenticated()?$q.when(service.currentUser):$http.get("/current_user").then(function(response){return service.currentUser=response.data.user,service.currentUser})},currentUser:null,isAuthenticated:function(){return!!service.currentUser}};return service});