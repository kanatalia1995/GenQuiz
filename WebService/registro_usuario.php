<?php
 header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');
header('Access-Control-Allow-Credentials: true');
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB);  // nombre de la base de datos

$correo = $_POST['correo'];
$nombre = $_POST['nombre'];
$contrasena=  $_POST['contrasena'];

	// Inicio de análisis de variables
	//Consulta a memoria
 	 $result = $dataBase->doQuery("CALL usp_registroUsuario('$nombre','$contrasena','$correo');");
 	 echo "success";
 	 $dataBase->close();
 	
 ?>