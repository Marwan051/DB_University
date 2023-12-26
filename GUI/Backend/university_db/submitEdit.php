<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");

if (isset($_POST)) {
    $data = json_decode(file_get_contents('php://input'), true);
    $id = $data['id'];
    $formData = $data['formData'];    
    if(empty($formData)){
        echo json_encode(array('status' => 'error', 'message' => 'No data sent'));
        exit();
    }else{
        if ($_SESSION["table_name"] == "student_phone" || $_SESSION["table_name"] == "instructor_phone") {
            $sql = "UPDATE `" . $_SESSION["table_name"] . "` SET ";
            foreach ($formData as $key => $value) {
               $sql .= "`$key` = '$value',";
            }
            $sql = substr($sql, 0, -1);
            $sql .= " WHERE `phone_number` = '$id'";
        }else{
            $sql = "UPDATE `" . $_SESSION["table_name"] . "` SET ";
            foreach ($formData as $key => $value) {
               $sql .= "`$key` = '$value',";
            }
            $sql = substr($sql, 0, -1);
            $sql .= " WHERE `".$_SESSION["table_name"]."_id` = '$id'";
        }
       
        try {
            $result = $conn->query($sql);
            if ($conn->error) {
                throw new Exception('Database error: ' . $conn->error);
            } else {
                echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
            }
        } catch (Exception $e) {
            echo json_encode(array('status' => 'error', 'message' => $e->getMessage()));
        }
    }
}