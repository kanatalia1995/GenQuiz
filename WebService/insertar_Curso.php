 <?php
 
 require("DataBase.php");
 $dataBase = new DataBase("localhost","root","123456","genQuiz"); // nombre de la base de datos
 $usuarioID= $_POST['idUsuario'];
$nombreCurso=  $_POST['nombreCurso'];
$codigoCurso = $_POST['codigoCurso'];
 //Consulta a memoria
 $result = $dataBase->doQuery("CALL usp_InsertarCursos('$codigoCurso','$nombreCurso',$usuarioID);");
 echo json_encode($nombreCurso);
 $dataBase->close();
 ?>