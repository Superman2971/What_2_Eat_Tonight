var wetApp = angular.module("wetApp",[]);

wetApp.controller("wetController",function($scope){

  $scope.modal = function(restaurant, location, user){
    alert(restaurant + "\n" + location + "\n" + "Contributed by: " + user);
  }
  
});