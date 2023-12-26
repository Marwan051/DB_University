<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");


if (isset($_POST)) {



    $data = json_decode(file_get_contents('php://input'), true);
    $data = $data["editData"];

    $sql = "SHOW INDEX FROM `".$_SESSION["table_name"]."`";
    $result = $conn->query($sql);
    $num = $result->num_rows;
    if ($num > 0) {
        $keys = array();
        foreach ($result as $key => $row) {
            $keys[] = $row["Column_name"];
        }
    }

    if ($_SESSION["table_name"] == "student_phone" || $_SESSION["table_name"] == "instructor_phone") {
        $sql = "SELECT * FROM `" . $_SESSION["table_name"] . "` where `phone_number` = '$data[phone_number]'";
     
    }else{
        $sql = "SELECT * FROM `" . $_SESSION["table_name"] . "` WHERE `".$_SESSION["table_name"]."_id` = '".$data[$_SESSION["table_name"]."_id"]."';";
       
    }

    $result = $conn->query($sql);
    $num = $result->num_rows;
    if ($num > 0) {
        $values = array();
        foreach ($result as $key => $row) {
            $values[] = $row;
        }
    }
    $result = (object)["keys"=>$keys,"values"=>$values];
echo json_encode($result);
}