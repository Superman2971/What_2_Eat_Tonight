var wetApp = angular.module("wetApp",[]);

wetApp.controller("wetController",function($scope){

  $scope.modal = function(cuisine, restaurant, location, user){
    alert("Looks like you should get some FUCKING " + cuisine + " tonight!\n" + restaurant + "\n" + location + "\n" + "Contributed by: " + user);
  }
  
});