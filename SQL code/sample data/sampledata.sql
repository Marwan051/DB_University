-- add departments
INSERT INTO `department` (`Dep_Name`, `Dep_id`) VALUES
	('Data Science', '200'),
	('Ai', '201'),
	('Cyber Security', '202'),
	('Business', '203'),
	('Medical Care', '204');


-- add instructors
INSERT INTO instructor (Fname, Lname, Date_of_birth, Instructor_id, Instructor_email, Department_id)
VALUES
  ('Mohamed', 'Ali', '1990-10-02', 1, 'mohamedali@gmail.com', 200),
  ('Ahmed', 'Mostafa', '1985-11-03', 2, 'ahmededmostafa@gmail.com', 204),
  ('Ali', 'Mohamed', '1983-12-04', 3, 'aledmohamed@gmail.com', 201),
  ('Esam', 'Omar', '1980-09-05', 4, 'esaedomar@gmail.com', 203),
  ('Tamer', 'Ahmed', '1987-08-06', 5, 'tameredahmed@gmail.com', 202),
  ('Belal', 'Esam', '1989-07-07', 6, 'belaledesam@gmail.com', 200),
  ('Yossef', 'Mahmoud', '1981-06-08', 7, 'yosseedmahmoud@gmail.com', 201),
  ('Mahmoud', 'Ahmed', '1986-05-09', 8, 'mahmoedahmed@gmail.com', 203),
  ('Mostafa', 'Ali', '1995-04-10', 9, 'mostaedali@gmail.com', 202),
  ('Marwan', 'Tamer', '1982-03-11', 10, 'marwantamer@gmail.com', 204);

-- Update department heads
UPDATE department SET Dep_head = 1 WHERE Dep_id = 200;
UPDATE department SET Dep_head = 2 WHERE Dep_id = 201;
UPDATE department SET Dep_head = 3 WHERE Dep_id = 202;
UPDATE department SET Dep_head = 4 WHERE Dep_id = 203;
UPDATE department SET Dep_head = 5 WHERE Dep_id = 204;


-- add instructor's phones
INSERT INTO `Instructor_phone` (`phone_number`, `Instructor_id`) VALUES
	('34567891', '1'),
	('39876543', '2'),
	('23467895', '3'),
	('29876435', '4'),
	('41235678', '5'),
	('49876532', '6'),
	('31234567', '7'),
	('31298765', '8'),
	('21987654', '9'),
	('41928376', '10');

-- add students
INSERT INTO `student` (`FName`, `LName`, `std_id`, `Acadimic_year`, `student_Email`, `Date_Of_birth`) VALUES
    ('Ahmed', 'Nagy', '1001', '1', 'ahmednagy@gmail.com', '2002-01-15'),
    ('Mohamed', 'Nasef', '2001', '2', 'mohamednasef@gmail.com', '2001-03-22'),
    ('Mahmoud', 'Abd Elrheem', '3001', '3', 'mahmoudabd elrheem@gmail.com', '2000-05-10'),
    ('Mostafa', 'Abd Alla', '4001', '4', 'mostafaabd alla@gmail.com', '1999-07-18'),
    ('Ali', 'Abd Alrahman', '1002', '1', 'aliabd alrahman@gmail.com', '2002-02-28'),
    ('Alaa', 'Noor', '2002', '2', 'alaanoor@gmail.com', '2001-04-12'),
    ('Belal', 'Naser', '3002', '3', 'belalnaser@gmail.com', '2000-06-25'),
    ('Abo Bakr', 'Zyad', '4002', '4', 'abo bakrzyad@gmail.com', '1999-08-08'),
    ('Youssef', 'Hesham', '1003', '1', 'youssefhesham@gmail.com', '2002-03-15'),
    ('Marwan', 'MoMen', '2003', '2', 'marwanmomen@gmail.com', '2001-05-22'),
    ('Essam', 'Eslam', '3003', '3', 'essameslam@gmail.com', '2000-07-10'),
    ('Emad', 'Essam', '4003', '4', 'emadessam@gmail.com', '1999-09-18'),
    ('Eslam', 'Emad', '1004', '1', 'eslamemad@gmail.com', '2002-04-28'),
    ('MoMen', 'Marwan', '2004', '2', 'momenmarwan@gmail.com', '2001-06-12'),
    ('Hesham', 'Youssef', '3004', '3', 'heshamyoussef@gmail.com', '2000-08-25'),
    ('Zyad', 'Abo Bakr', '4004', '4', 'zyadabo bakr@gmail.com', '1999-10-08'),
    ('Marwa', 'Belal', '1005', '1', 'marwabelal@gmail.com', '2002-05-15'),
    ('Nada', 'Alaa', '2005', '2', 'nadaalaa@gmail.com', '2001-07-20'),
    ('Aliaa', 'Ali', '3005', '3', 'aliaaali@gmail.com', '2000-09-28'),
    ('Rehab', 'Mostafa', '4005', '4', 'rehabmostafa@gmail.com', '1999-11-18'),
    ('Eman', 'Mahmoud', '1006', '1', 'emanmahmoud@gmail.com', '2002-06-28'),
    ('Reem', 'Mohamed', '2006', '2', 'reemmohamed@gmail.com', '2001-08-10'),
    ('Randa', 'Ahmed', '3006', '3', 'randaahmed@gmail.com', '2000-10-22'),
    ('Raghda', 'Ali', '4006', '4', 'raghdaali@gmail.com', '1999-12-08'),
    ('Nagham', 'Marwan', '1007', '1', 'naghammarwan@gmail.com', '2002-07-15'),
    ('Naser', 'Belal', '2007', '2', 'naserbelal@gmail.com', '2001-09-20'),
    ('Noor', 'Mahmoud', '3007', '3', 'noormahmoud@gmail.com', '2000-11-28'),
    ('Abd Alla', 'Ahmed', '4007', '4', 'abd allaahmed@gmail.com', '2000-01-18'),
    ('Abd Alrahman', 'Mohamed', '1008', '1', 'abd alrahmanmohamed@gmail.com', '2002-08-28'),
    ('Abd Elrheem', 'Noor', '2008', '2', 'abd elrheemnoor@gmail.com', '2001-10-10'),
    ('Nasef', 'Naser', '3008', '3', 'nasefnaser@gmail.com', '2000-12-22'),
    ('Nagy', 'Nasef', '4008', '4', 'nagynasef@gmail.com', '2000-02-15');

-- add student phone
INSERT INTO `student_phone` (`phone_number`, `std_id`) VALUES
	('1234567', '1001'),
	('8901234', '1002'),
	('5678901', '1003'),
	('2345678', '1004'),
	('9012345', '1005'),
	('6789012', '1006'),
	('3456789', '1007'),
	('9876541', '1008'),
	('3210987', '2001'),
	('6543210', '2002'),
	('9876543', '2003'),
	('2109876', '2004'),
	('5432109', '2005'),
	('8765432', '2006'),
	('1098765', '2007'),
	('4321098', '2008'),
	('7654321', '3001'),
	('7452397', '3002'),
	('3366889', '3003'),
	('2277990', '3004'),
	('1188002', '3005'),
	('9900118', '3006'),
	('7722330', '3007'),
	('4455660', '3008'),
	('5599220', '4001'),
	('6622779', '4002'),
	('2238945', '4003'),
	('9834074', '4004'),
	('7345073', '4005'),
	('2936864', '4006'),
	('2307936', '4007'),
	('2037927', '4008');

-- add courses
    INSERT INTO `course` (`course_name`, `course_id`, `credit_hours`, `Instructor_id`, `prerequsite`) VALUES
	('Machine Learning', '1202', '3', '5', '4202'),
	('Intro To Ai', '2201', '3', '7', '5201'),
	('Data Science', '3200', '3', '1', '6200'),
	('Data Structure', '4202', '3', '9', ''),
	('Regression', '5201', '3', '3', ''),
	('Linar Algebra', '6200', '3', '6', ''),
	('Data Methodology', '7204', '3', '2', ''),
	('Data Tools', '8204', '3', '10', '7204'),
	('Data Mining', '9203', '3', '4', '10203'),
	('Calculus', '10203', '3', '8','');

-- add grades
INSERT INTO `grade` (`std_id`, `course_id`, `grade_id`, `grade`) VALUES
	('1001', '1202', '0', 'D-'),
	('2001', '2201', '1', 'D+'),
	('3001', '3200', '2', 'C'),
	('4001', '4202', '3', 'B-'),
	('1002', '5201', '4', 'A'),
	('2002', '6200', '5', 'A'),
	('3002', '7204', '6', 'F'),
	('4002', '8204', '7', 'A-'),
	('1003', '9203', '8', 'B'),
	('2003', '10203', '9', 'D+'),
	('3003', '1202', '10', 'D'),
	('4003', '2201', '11', 'B-'),
	('1004', '3200', '12', 'A-'),
	('2004', '4202', '13', 'A-'),
	('3004', '5201', '14', 'D'),
	('4004', '6200', '15', 'C-'),
	('1005', '7204', '16', 'C+'),
	('2005', '8204', '17', 'B'),
	('3005', '9203', '18', 'A+'),
	('4005', '10203', '19', 'B-'),
	('1006', '1202', '20', 'C'),
	('2006', '2201', '21', 'D+'),
	('3006', '3200', '22', 'D'),
	('4006', '4202', '23', 'A-'),
	('1007', '5201', '24', 'B-'),
	('2007', '6200', '25', 'C'),
	('3007', '7204', '26', 'D+'),
	('4007', '8204', '27', 'D'),
	('1008', '9203', '28', 'A+'),
	('2008', '10203', '29', 'B+'),
	('3008', '1202', '30', 'C-'),
	('4008', '2201', '31', 'D-'),
	('1001', '3200', '32', 'A'),
	('2001', '4202', '33', 'B'),
	('3001', '5201', '34', 'C+'),
	('4001', '6200', '35', 'A-'),
	('1002', '7204', '36', 'A-'),
	('2002', '8204', '37', 'A'),
	('3002', '9203', '38', 'A'),
	('4002', '10203', '39', 'A'),
	('1003', '1202', '40', 'A'),
	('2003', '2201', '41', 'A+'),
	('3003', '3200', '42', 'A+'),
	('4003', '4202', '43', 'B-'),
	('1004', '5201', '44', 'B-'),
	('2004', '6200', '45', 'B'),
	('3004', '7204', '46', 'B'),
	('4004', '8204', '47', 'B'),
	('1005', '9203', '48', 'B'),
	('2005', '10203', '49', 'B+'),
	('3005', '1202', '50', 'B+'),
	('4005', '2201', '51', 'C'),
	('1006', '3200', '52', 'C'),
	('2006', '4202', '53', 'C'),
	('3006', '5201', '54', 'C'),
	('4006', '6200', '55', 'C+'),
	('1007', '7204', '56', 'C+'),
	('2007', '8204', '57', 'C+'),
	('3007', '9203', '58', 'C+'),
	('4007', '10203', '59', 'C+'),
	('1008', '1202', '60', 'B-'),
	('2008', '2201', '61', 'A-'),
	('3008', '3200', '62', 'F'),
	('4008', '4202', '63', 'D'),
	('1001', '5201', '64', 'D+'),
	('2001', '6200', '65', 'D+'),
	('3001', '7204', '66', 'D+'),
	('4001', '8204', '67', 'D+'),
	('1002', '9203', '68', 'C-'),
	('2002', '10203', '69', 'C-'),
	('3002', '1202', '70', 'C-'),
	('4002', '2201', '71', 'C-'),
	('1003', '3200', '72', 'C'),
	('2003', '4202', '73', 'D+'),
	('3003', '5201', '74', 'F'),
	('4003', '6200', '75', 'A-');


-- add enrolling
INSERT INTO `enrolling` (`enroling_id`, `std_id`, `course_id`) VALUES
	('0', '1001', '1202'),
	('1', '2001', '2201'),
	('2', '3001', '3200'),
	('3', '4001', '4202'),
	('4', '1002', '5201'),
	('5', '2002', '6200'),
	('6', '3002', '7204'),
	('7', '4002', '8204'),
	('8', '1003', '9203'),
	('9', '2003', '10203'),
	('10', '3003', '1202'),
	('11', '4003', '2201'),
	('12', '1004', '3200'),
	('13', '2004', '4202'),
	('14', '3004', '5201'),
	('15', '4004', '6200'),
	('16', '1005', '7204'),
	('17', '2005', '8204'),
	('18', '3005', '9203'),
	('19', '4005', '10203'),
	('20', '1006', '1202'),
	('21', '2006', '2201'),
	('22', '3006', '3200'),
	('23', '4006', '4202'),
	('24', '1007', '5201'),
	('25', '2007', '6200'),
	('26', '3007', '7204'),
	('27', '4007', '8204'),
	('28', '1008', '9203'),
	('29', '2008', '10203'),
	('30', '3008', '1202'),
	('31', '4008', '2201'),
	('32', '1001', '3200'),
	('33', '2001', '4202'),
	('34', '3001', '5201'),
	('35', '4001', '6200'),
	('36', '1002', '7204'),
	('37', '2002', '8204'),
	('38', '3002', '9203'),
	('39', '4002', '10203'),
	('40', '1003', '1202'),
	('41', '2003', '2201'),
	('42', '3003', '3200'),
	('43', '4003', '4202'),
	('44', '1004', '5201'),
	('45', '2004', '6200'),
	('46', '3004', '7204'),
	('47', '4004', '8204'),
	('484', '1005', '9203'),
	('49', '2005', '10203'),
	('50', '3005', '1202'),
	('51', '4005', '2201'),
	('52', '1006', '3200'),
	('53', '2006', '4202'),
	('54', '3006', '5201'),
	('55', '4006', '6200'),
	('56', '1007', '7204'),
	('57', '2007', '8204'),
	('58', '3007', '9203'),
	('59', '4007', '10203'),
	('60', '1008', '1202'),
	('61', '2008', '2201'),
	('62', '3008', '3200'),
	('63', '4008', '4202'),
	('64', '1001', '5201'),
	('65', '2001', '6200'),
	('66', '3001', '7204'),
	('67', '4001', '8204'),
	('68', '1002', '9203'),
	('69', '2002', '10203'),
	('70', '3002', '1202'),
	('71', '4002', '2201'),
	('72', '1003', '3200'),
	('73', '2003', '4202'),
	('74', '3003', '5201'),
	('75', '4003', '6200');