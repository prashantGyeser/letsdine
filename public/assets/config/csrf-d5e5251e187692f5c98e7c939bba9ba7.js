(function(){letsdineApp.config(function($httpProvider){var authToken;return authToken=$('meta[name="csrf-token"]').attr("content"),$httpProvider.defaults.headers.common["X-CSRF-TOKEN"]=authToken})}).call(this);