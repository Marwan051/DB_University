create table Department( Department_id varchar(10) primary key,Department_Name varchar (50) not null, Department_head varchar(10));
create table Instructor (Instructor_id  varchar(10) primary key, Fname varchar(50) not null, Lname varchar(50) not null, Date_of_birth date ,  Instructor_email varchar(50), Department_id varchar(10), foreign key(Department_id) references Department(department_id));
create table  Instructor_phone(phone_number varchar(11) primary key,Instructor_id varchar(10), foreign key (Instructor_id) references Instructor(Instructor_id));
create table student ( student_id varchar(10) primary key, FName varchar(50) not null,Date_of_birth date, LName varchar(50), Acadimic_year varchar(10),  student_Email varchar(50));
create table  student_phone(phone_number varchar(11) primary key, student_id varchar(10), foreign key(student_id) references student(student_id));
create table course ( course_id varchar(10) primary key,course_name varchar(50) not null, credit_hours int, Instructor_id varchar(10), prerequsite varchar(10)  NULL,foreign key(Instructor_id) references Instructor(Instructor_id),foreign key(prerequsite) references course(course_id));
create table grade(  grade_id varchar(10) primary key, student_id varchar(10), course_id varchar(10),grade varchar(2), foreign key (student_id) references student(student_id), foreign key(course_id) references course(course_id));
create table enrolling ( enrolling_id varchar(10) primary key,student_id varchar(10) , course_id varchar(10),  foreign key(course_id) references course(course_id) , foreign key(student_id) references student(student_id)) ;
ALTER TABLE Department add (FOREIGN KEY(Department_head) REFERENCES Instructor(Instructor_id));