<?php
	require "conn.php";
	$user_name = $_POST["user_name"];
	$user_pass = $_POST["password"];
	$mysql_qry = "call usp_getUser ($user_name, $user_pass)";
	$result = mysqli_query($conn, $mysql_qry);
	if (mysqli_num_rows($result)>0){
		echo "login success";
	}
	else {
		echo "login not succesful";
	}
?>