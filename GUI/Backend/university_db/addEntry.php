<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");


if (isset($_POST)) {
    $table_name = $_SESSION["table_name"];
    $addSql = "SELECT `COLUMN_NAME` 
    FROM `INFORMATION_SCHEMA`.`COLUMNS` 
    WHERE `TABLE_SCHEMA`='university_db' 
        AND `TABLE_NAME`='$table_name';";
    $result = $conn->query($addSql);
    $num = $result->num_rows;
    if ($num > 0) {
        $columns = array();
        foreach ($result as $key => $row) {
            $columns[$key] = $row["COLUMN_NAME"];
        }
        echo json_encode( $columns);
    } else {
        echo json_encode(null);
    }
}
