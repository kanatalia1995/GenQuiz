<?php
 
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB);  // nombre de la base de datos

$correo = $_POST['correo'];
$contrasena=  $_POST['contrasena'];

	// Inicio de análisis de variables
	//Consulta a memoria
 	 $result = $dataBase->doQuery("CALL usp_login ('$correo','$contrasena');");
 	 echo json_encode($result);
 	 $dataBase->close();
 	
 ?>