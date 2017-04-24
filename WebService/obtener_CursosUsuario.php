<?php
 
 require("DataBase.php");
 $dataBase = new DataBase("localhost","root","123456","genQuiz"); // nombre de la base de datos

//$idUsuario = $_POST['idUsuario'];
	// Inicio de análisis de variables
	//Consulta a memoria
 	 $result = $dataBase->doQuery("call csp_obtenerCursosUsuario(15);");
 	 echo json_encode($result);
 	 $dataBase->close();
 	
 ?>