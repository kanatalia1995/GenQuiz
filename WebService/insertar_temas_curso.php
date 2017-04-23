 <?php
 
 require("DataBase.php");
 $dataBase = new DataBase("localhost","root","123456","genQuiz"); // nombre de la base de datos

$usuarioID= $_POST['idUsuario'];
$cursoID=  $_POST['idCurso'];
$nombreTema = $_POST['nombreTema'];

 //Consulta a memoria
 $result = $dataBase->doQuery("call usp_InsertarTemas($cursoID,$usuarioID,'$nombreTema');");
 echo json_encode($result);
 $dataBase->close();
 ?>