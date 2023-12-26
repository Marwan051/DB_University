<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");

if(isset($_POST)){
    $data = json_decode(file_get_contents('php://input'), true);
    $addData = $data["addData"];
    $table_name = $_SESSION["table_name"];
    $sql = "INSERT INTO `$table_name` (";
    foreach ($addData as $key => $value) {
        $sql .= "`$key`,";
    }
    $sql = substr($sql,0,-1);
    $sql .= ") VALUES (";
    foreach ($addData as $key => $value) {
        $sql .= "'$value',";
    }
    $sql = substr($sql,0,-1);
    $sql .= ");";
    try {
        $conn->query($sql);
        $sql= array("status"=>"success","message"=>"Data added successfully");
    } catch (Exception $e) {
        $sql = array("status"=>"error","message"=>$e->getMessage());
    }
    echo json_encode($sql);

}