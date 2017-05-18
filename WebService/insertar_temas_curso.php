 <?php
 
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB); 

$usuarioID= $_POST['idUsuario'];
$cursoID=  $_POST['idCurso'];
$nombreTema = $_POST['nombreTema'];

 //Consulta a memoria
 $result = $dataBase->doQuery("call usp_InsertarTemas($cursoID,$usuarioID,'$nombreTema');");
 echo json_encode($result);
 $dataBase->close();
 ?>