<?php
session_start();
include("dbconn.php");
header("Access-Control-Allow-Origin: http://localhost:5173 ");
header("Access-Control-Allow-Methods: POST"); 
header("Access-Control-Allow-Headers: Content-Type"); 
header("Access-Control-Allow-Credentials: true");


$student_phone_query = "SELECT st.student_id, concat(st.FName,' ',st.LName) as Name, ph.phone_number  
from `student_phone` as ph INNER JOIN `student` as st on st.student_id = ph.student_id;";
$instrucor_phone_query = "SELECT ph.instructor_id, concat(inst.FName,' ',inst.LName) as Name, ph.phone_number 
from `Instructor_phone` as ph 
INNER JOIN `Instructor` as inst on inst.Instructor_id = ph.Instructor_id;";
$course_query = "SELECT c.course_id,c.course_name,c.credit_hours,concat(inst.Fname,' ',inst.Lname) as 'Instructor Name'  ,c2.course_name as 'Prerequsite Name'
from `course` as c
LEFT JOIN  `Instructor` as inst on inst.Instructor_id = c.Instructor_id 
LEFT JOIN `course` as c2 on c.prerequsite = c2.course_id ;";
$department_query = "SELECT dp.department_id,dp.Department_Name,concat(inst.Fname,' ',inst.Lname) as 'Department Head'
FROM `Department` as dp
LEFT JOIN `Instructor` as inst on dp.Department_head = inst.Instructor_id;";
$grade_query = "SELECT gd.grade_id,concat(st.FName,' ' ,st.LName) as 'Student Name',c.course_name as 'Course Name', gd.grade
FROM `grade` as gd
LEFT JOIN `student` as st on gd.student_id = st.student_id
LEFT JOIN `course` as c on gd.course_id = c.course_id;";
$enrolling_query = "SELECT en.enrolling_id,concat(st.FName,' ' ,st.LName) as 'Student Name',c.course_name as 'Course Name'
FROM `enrolling` as en
LEFT JOIN `student` as st on en.student_id = st.student_id
LEFT JOIN `course` as c on en.course_id = c.course_id;";
$student_query = 'SELECT * FROM `student`';
$instructor_query = "SELECT inst.Instructor_id, inst.Fname, inst.Lname,dp.Department_Name as 'Department Name', inst.Date_of_birth,inst.Instructor_email
FROM `Instructor` as inst
LEFT JOIN `Department` as dp on inst.Department_id = dp.department_id;";
$sql= '';
if (isset($_POST)) {

    $data = json_decode(file_get_contents('php://input'), true);
    $table_name = $data["table_name"];
    $_SESSION["table_name"] = $table_name;
    switch ($table_name) {
        case 'student_phone':
            $sql = $student_phone_query;
            break;
        case 'instructor_phone':
            $sql =$instrucor_phone_query;
            break;
        case 'course':
            $sql = $course_query;
            break;
        case 'department':
            $sql = $department_query;
            break;
        case 'grade':
            $sql = $grade_query;
            break;
        case 'enrolling':
            $sql = $enrolling_query;
            break;
        case 'student':
            $sql = $student_query;
            break;
        case 'instructor':
            $sql = $instructor_query;
            break;
        default:
            break;
    }
    if($sql == '') return json_encode(null);
    $result = $conn->query($sql);
    $num = $result->num_rows;
    if ($num > 0) {
        $table_data = new stdClass();
        foreach ($result as $key => $row) {
            $table_data->$key = (object) $row;
        }
        echo json_encode($table_data);
    } else {
        echo json_encode(null);
    }

}