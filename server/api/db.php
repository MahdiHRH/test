<?php 
$servername = "localhost";
$username = "instasek_mahdihrh";
$password = "mahdi159753";
$database = "instasek_myapp";
 
$conn = new mysqli($servername, $username, $password, $database);
 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>