<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');
header('Access-Control-Allow-Credentials: true');

require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB); // nombre de la base de datos

$accion= $_POST['accion'];

if ($accion == 'A'){ //Actualizar
	$idUsuario = $_POST['id'];
	$nombre = $_POST['nombre'];
	$informacion = $_POST['informacion'];

	if (empty($_POST['contrasena'])){
		$result = $dataBase->doQuery("CALL usp_actualizarUsuario($idUsuario,'$nombre','','$informacion');");
	}else {
		$contrasena= $_POST['contrasena'];
		$result = $dataBase->doQuery("CALL usp_actualizarUsuario($idUsuario,'$nombre', '$contrasena', '$informacion');");
	}
	
}
if ($accion == 'C'){ // Consulta de información de usuario
	$idUsuario = $_POST['id'];
	$result = $dataBase->doQuery("CALL csp_obtenerDatosUsuario($idUsuario);"); // Retorna nombre, correo, información
}
if ($accion == 'D') {
// Deshabilitar la cuenta
	$idUsuario = $_POST['id'];
	$result = $dataBase->doQuery("CALL esp_deshabilitarUsuario($idUsuario);"); // procedimiento  no desarrollado, debido a lógica

}
echo json_encode($result);
$dataBase->close();


?>