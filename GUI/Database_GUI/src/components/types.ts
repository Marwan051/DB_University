type student = {
    Student_Id: String,
    First_Name: String,
    Last_Name: String,
    Date_Of_Birth: String,
    Phone_Number: String,
    Email: String,
    Academic_Year: number,
    GPA: number,
}
type course = {
    Course_Id: String,
    Course_Name: String,  
    Instructor_Id: String,
    Prerequisite: String,
    Credit_hours: number,
}

type instructor = {
    Instructor_Id: String,
    First_Name: String,
    Last_Name: String,
    Date_Of_Birth: String,
    Phone_Number: String,
    Email: String,
    Department_ID: String,
}
type Grade = {
    Grade_Id: String,
    Student_Id: String,
    Course_Id: String,
    Grade: String,
}
type Department = {
    Department_Id: String,
    Department_Name: String,
    Department_head_ID: String,
}

type data = {
    [key: string]: student;
} | {
    [key: string]: course;
} | {
    [key: string]: instructor;
} | {
    [key: string]: Grade;
} | {
    [key: string]: Department;
} 
export type {student, course, instructor, Grade, Department, data}