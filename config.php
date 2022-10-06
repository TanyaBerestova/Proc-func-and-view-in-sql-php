<?php
header('Content-Type: text/html; charset=utf-8');
$host = 'localhost';
$user = 'root';
$password = 'vertrigo';
$db = 'university';

//процедурный стиль
$con = mysqli_connect($host, $user, $password, $db);
mysqli_query($con, "SET NAMES 'utf-8'");

//объектный стиль
$mysqli = new mysqli($host, $user, $password, $db);
$mysqli->query("SET NAMES 'utf-8'");

//PDO
$dsn = 'mysql:host=localhost;port=3307;dbname=university;charset=utf8;';
$connect = new PDO($dsn, $user, $password);

//if (!$connect){
//    echo '<br>Невозможно присоединиться к серверу: '.mysql_error($connect);
//    exit;
//} else {
//    echo '<br>успешно';
//}
?>

