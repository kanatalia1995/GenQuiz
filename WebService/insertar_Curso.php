 <?php
 
 require("DataBase.php");
 require ("config.php");
 $dataBase = new DataBase($HTTP,$USUARIO,$CONTRASENA,$DB); 

 $usuarioID= $_POST['idUsuario'];
$nombreCurso=  $_POST['nombreCurso'];
$codigoCurso = $_POST['codigoCurso'];
 //Consulta a memoria
 $result = $dataBase->doQuery("CALL usp_InsertarCursos('$codigoCurso','$nombreCurso',$usuarioID);");
 echo json_encode($nombreCurso);
 $dataBase->close();
 ?>