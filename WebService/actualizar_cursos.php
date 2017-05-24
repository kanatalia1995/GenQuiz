<?php
 header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');
header('Access-Control-Allow-Credentials: true');
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB); 

$cursoID = $_POST['idCurso'];
$nombreCurso=  $_POST['nombreCurso'];
$codigoCurso = $_POST['codigoCurso'];

	// Inicio de análisis de variables
	//Consulta a memoria
 	$result = $dataBase->doQuery("CALL usp_ActualizarCursos('$codigoCurso','$nombreCurso',$cursoID);");
 	echo json_encode($result);
 	$dataBase->close();
  ?>