var wetApp = angular.module("wetApp",[]);

wetApp.controller("wetController",["$scope", function($scope){

  $scope.modal = function(cuisine, restaurant, location, user){
    $scope.cuisine = cuisine;
    $scope.restaurant = restaurant;
    $scope.location = location;
    $scope.user = user;

    var address = $scope.location;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            animation: google.maps.Animation.DROP,
            position: results[0].geometry.location
        });
        setTimeout(function() {
            google.maps.event.trigger(map,'resize');
        }, 500);
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }



  // Google Maps Script
  var geocoder;
  var map;
  function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(34.013, -118.494);
    var mapOptions = {
      zoom: 15,
      center: latlng
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  }

  google.maps.event.addDomListener(window, 'load', initialize);


}]);
