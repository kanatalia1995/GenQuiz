'use strict';

 angular.module('genQuizApp').controller('agregarCurso', ['$scope','$http', '$routeParams', '$location', '$window',
    function($scope, $http, $routeParams, $location, $window) {

		$scope.agregarCurso = function(){

			var codigo_curso = $scope.codigo;
			var nombre_curso = $scope.nombre; 

			alert("codigo: "+ codigo_curso +"Nombre: "+ nombre_curso);

			$scope.guardarInformacion();
		};

		$scope.guardarInformacion = function() {
			$http.get("insertar_curso.php", {params:  
				{
					nombre : $scope.nombre,
					codigo : $scope.codigo
				}
			})
			.success(function (responseD) {
		        	//console.log("Response");
		            console.log(responseD);
		    });
		};
    }
]);
