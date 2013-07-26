# Controllers

angular
  .module('influences.controllers', [])
  .controller('IndividualCtrl', ['$scope', '$http', ($scope, $http)->
    # Pull down data about the individual
    $scope.zip = $scope.zip or 94102
    get_data_by_zip = ()->
      $http
        url: "http://congress.api.sunlightfoundation.com/legislators/locate?zip=#{$scope.zip}&apikey=83c0368c509f468e992218f41e6529d7"
        method: "GET"
      .success (data, status, headers, config)->
        $scope.reps = data.results
        for rep in $scope.reps
          rep.fullname = "" + rep.title + " " + rep.first_name + " " + rep.last_name
      .error (data, status, headers, config)->
        $scope.status = status
    get_data_by_zip()  # initial run
    $scope.$watch('zip', get_data_by_zip)
    #do other stuff
  ])
  .controller('BillCtrl', ['$scope', ($scope)->
    $scope.name = "hahah"
  ])
