<?php
	$db_name = "genquiz";
	$mysql_username = "root";
	$mysql_password = "Deadpool";
	$server_name = "localhost";
	$conn = mysqli_connect($server_name, $mysql_username, $mysql_password, $db_name);
	if ($conn) {
		echo "connection success";
	}
	else {
		echo "connection unsuccesful";
	}
?>