<?php
 
 require("DataBase.php");
 $dataBase = new DataBase("localhost","root","123456","genQuiz"); // nombre de la base de datos

$idCurso = $_POST['idCurso'];
	// Inicio de análisis de variables
	//Consulta a memoria
 	 $result = $dataBase->doQuery("call csp_obtenerTemasCurso($idCurso);");
 	 echo json_encode($result);
 	 $dataBase->close();
 	
 ?>