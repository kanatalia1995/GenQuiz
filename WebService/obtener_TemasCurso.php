<?php
 
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB); / nombre de la base de datos

$idCurso = $_POST['idCurso'];
	// Inicio de análisis de variables
	//Consulta a memoria
 	 $result = $dataBase->doQuery("call csp_obtenerTemasCurso($idCurso);");
 	 echo json_encode($result);
 	 $dataBase->close();
 	
 ?>