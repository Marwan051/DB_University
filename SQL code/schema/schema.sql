create table Department(Dep_Name varchar (50) not null, Dep_id varchar(10) primary key, Dep_head varchar(10));
create table Instructor ( Fname varchar(50) not null, Lname varchar(50) not null, Data_of_brith date , Instructor_id  varchar(10) primary key, Instructor_email varchar(10), Department_id varchar(10), foreign key(Department_id) references Department(Dep_id));
create table  Instructor_phone(phone_number varchar(11) primary key,Instructor_id varchar(10), foreign key (Instructor_id) references Instructor(Instructor_id));
create table student ( FName varchar(50) not null,Date_of_brith date, LName varchar(50), std_id varchar(10) primary key, Acadimic_year varchar(10),  student_Email varchar(50));
create table  studentphone(phone_number varchar(11) primary key, std_id varchar(10), foreign key(std_id) references student(std_id));
create table course ( course_name varchar(50) not null, course_id varchar(10) primary key, credit_hours int, Instructor_id varchar(10), prerequsite varchar(50) not null,foreign key(Instructor_id) references Instructor(Instructor_id));
create table grade( std_id varchar(10), course_id varchar(10), grade_id varchar(10) primary key, grade varchar(2), foreign key (std_id) references student(std_id), foreign key(course_id) references course(course_id));
create table enroling ( enroling_id varchar(10) primary key,std_id varchar(10) , course_id varchar(10),  foreign key(course_id) references course(course_id) , foreign key(std_id) references student(std_id)) ;
