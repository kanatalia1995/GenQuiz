<?php
 
 require("DataBase.php");
 $dataBase = new DataBase("localhost","root","123456","genQuiz"); // nombre de la base de datos

$cursoID = $_POST['idCurso'];
$nombreCurso=  $_POST['nombreCurso'];
$codigoCurso = $_POST['codigoCurso'];

	// Inicio de análisis de variables
	//Consulta a memoria
 	$result = $dataBase->doQuery("CALL usp_ActualizarCursos('$codigoCurso','$nombreCurso',$cursoID);");
 	echo json_encode($result);
 	$dataBase->close();
  ?>