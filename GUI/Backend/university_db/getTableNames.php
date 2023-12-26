<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");

$sql = "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' and TABLE_SCHEMA='university_db';";
if(isset($_POST)){
    $table_names = array();
    $result = $conn->query($sql);
    $num = $result->num_rows;
    if ($num > 0) {
        foreach ($result as $key => $row) {
            $table_names[$key] = $row["TABLE_NAME"];
        }
        
        echo json_encode(['table_names' => $table_names]);
    } else {
        echo json_encode(null);
    }
}