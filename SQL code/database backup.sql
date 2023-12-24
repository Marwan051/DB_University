-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql204.infinityfree.com
-- Generation Time: Dec 24, 2023 at 04:10 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_35665917_university_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `Instructor_id` varchar(10) DEFAULT NULL,
  `prerequsite` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `credit_hours`, `Instructor_id`, `prerequsite`) VALUES
('10203', 'Calculus', 3, '8', NULL),
('4202', 'Data Structure', 3, '9', NULL),
('6200', 'Linear Algebra', 3, '6', NULL),
('7204', 'Data Methodology', 3, '2', NULL),
('2201', 'Intro To Ai', 3, '7', '10203'),
('1202', 'Machine Learning', 3, '5', '2201'),
('5201', 'Regression', 3, '3', '2201'),
('3200', 'Data Science', 3, '1', '10203'),
('8204', 'Data Tools', 3, '10', '3200'),
('9203', 'Data Mining', 3, '4', '8204');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `Department_id` varchar(10) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `Department_head` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Department_id`, `Department_Name`, `Department_head`) VALUES
('200', 'Data Science', '1'),
('201', 'Ai', '2'),
('202', 'Cyber Security', '3'),
('203', 'Business', '4'),
('204', 'Medical Care', '5');

-- --------------------------------------------------------

--
-- Table structure for table `enrolling`
--

CREATE TABLE `enrolling` (
  `enrolling_id` varchar(10) NOT NULL,
  `student_id` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolling`
--

INSERT INTO `enrolling` (`enrolling_id`, `student_id`, `course_id`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` varchar(10) NOT NULL,
  `student_id` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `student_id`, `course_id`, `grade`) VALUES
('0', '1001', '1202', 'D-'),
('1', '2001', '2201', 'D+'),
('2', '3001', '3200', 'C'),
('3', '4001', '4202', 'B-'),
('4', '1002', '5201', 'A'),
('5', '2002', '6200', 'A'),
('6', '3002', '7204', 'F'),
('7', '4002', '8204', 'A-'),
('8', '1003', '9203', 'B'),
('9', '2003', '10203', 'D+'),
('10', '3003', '1202', 'D'),
('11', '4003', '2201', 'B-'),
('12', '1004', '3200', 'A-'),
('13', '2004', '4202', 'A-'),
('14', '3004', '5201', 'D'),
('15', '4004', '6200', 'C-'),
('16', '1005', '7204', 'C+'),
('17', '2005', '8204', 'B'),
('18', '3005', '9203', 'A+'),
('19', '4005', '10203', 'B-'),
('20', '1006', '1202', 'C'),
('21', '2006', '2201', 'D+'),
('22', '3006', '3200', 'D'),
('23', '4006', '4202', 'A-'),
('24', '1007', '5201', 'B-'),
('25', '2007', '6200', 'C'),
('26', '3007', '7204', 'D+'),
('27', '4007', '8204', 'D'),
('28', '1008', '9203', 'A+'),
('29', '2008', '10203', 'B+'),
('30', '3008', '1202', 'C-'),
('31', '4008', '2201', 'D-'),
('32', '1001', '3200', 'A'),
('33', '2001', '4202', 'B'),
('34', '3001', '5201', 'C+'),
('35', '4001', '6200', 'A-'),
('36', '1002', '7204', 'A-'),
('37', '2002', '8204', 'A'),
('38', '3002', '9203', 'A'),
('39', '4002', '10203', 'A'),
('40', '1003', '1202', 'A'),
('41', '2003', '2201', 'A+'),
('42', '3003', '3200', 'A+'),
('43', '4003', '4202', 'B-'),
('44', '1004', '5201', 'B-'),
('45', '2004', '6200', 'B'),
('46', '3004', '7204', 'B'),
('47', '4004', '8204', 'B'),
('48', '1005', '9203', 'B'),
('49', '2005', '10203', 'B+'),
('50', '3005', '1202', 'B+'),
('51', '4005', '2201', 'C'),
('52', '1006', '3200', 'C'),
('53', '2006', '4202', 'C'),
('54', '3006', '5201', 'C'),
('55', '4006', '6200', 'C+'),
('56', '1007', '7204', 'C+'),
('57', '2007', '8204', 'C+'),
('58', '3007', '9203', 'C+'),
('59', '4007', '10203', 'C+'),
('60', '1008', '1202', 'B-'),
('61', '2008', '2201', 'A-'),
('62', '3008', '3200', 'F'),
('63', '4008', '4202', 'D'),
('64', '1001', '5201', 'D+'),
('65', '2001', '6200', 'D+'),
('66', '3001', '7204', 'D+'),
('67', '4001', '8204', 'D+'),
('68', '1002', '9203', 'C-'),
('69', '2002', '10203', 'C-'),
('70', '3002', '1202', 'C-'),
('71', '4002', '2201', 'C-'),
('72', '1003', '3200', 'C'),
('73', '2003', '4202', 'D+'),
('74', '3003', '5201', 'F'),
('75', '4003', '6200', 'A-');

-- --------------------------------------------------------

--
-- Table structure for table `Instructor`
--

CREATE TABLE `Instructor` (
  `Instructor_id` varchar(10) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Instructor_email` varchar(50) DEFAULT NULL,
  `Department_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Instructor`
--

INSERT INTO `Instructor` (`Instructor_id`, `Fname`, `Lname`, `Date_of_birth`, `Instructor_email`, `Department_id`) VALUES
('1', 'Mohamed', 'Ali', '1990-10-02', 'mohamedali@gmail.com', '200'),
('2', 'Ahmed', 'Mostafa', '1985-11-03', 'ahmededmostafa@gmail.com', '204'),
('3', 'Ali', 'Mohamed', '1983-12-04', 'aledmohamed@gmail.com', '201'),
('4', 'Esam', 'Omar', '1980-09-05', 'esaedomar@gmail.com', '203'),
('5', 'Tamer', 'Ahmed', '1987-08-06', 'tameredahmed@gmail.com', '202'),
('6', 'Belal', 'Esam', '1989-07-07', 'belaledesam@gmail.com', '200'),
('7', 'Yossef', 'Mahmoud', '1981-06-08', 'yosseedmahmoud@gmail.com', '201'),
('8', 'Mahmoud', 'Ahmed', '1986-05-09', 'mahmoedahmed@gmail.com', '203'),
('9', 'Mostafa', 'Ali', '1995-04-10', 'mostaedali@gmail.com', '202'),
('10', 'Marwan', 'Tamer', '1982-03-11', 'marwantamer@gmail.com', '204');

-- --------------------------------------------------------

--
-- Table structure for table `Instructor_phone`
--

CREATE TABLE `Instructor_phone` (
  `phone_number` varchar(11) NOT NULL,
  `Instructor_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Instructor_phone`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(10) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `Acadimic_year` varchar(10) DEFAULT NULL,
  `student_Email` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `FName`, `Date_of_birth`, `LName`, `Acadimic_year`, `student_Email`) VALUES
('1001', 'Ahmed', '2002-01-15', 'Nagy', '1', 'ahmednagy@gmail.com'),
('2001', 'Mohamed', '2001-03-22', 'Nasef', '2', 'mohamednasef@gmail.com'),
('3001', 'Mahmoud', '2000-05-10', 'Abd Elrheem', '3', 'mahmoudabd elrheem@gmail.com'),
('4001', 'Mostafa', '1999-07-18', 'Abd Alla', '4', 'mostafaabd alla@gmail.com'),
('1002', 'Ali', '2002-02-28', 'Abd Alrahman', '1', 'aliabd alrahman@gmail.com'),
('2002', 'Alaa', '2001-04-12', 'Noor', '2', 'alaanoor@gmail.com'),
('3002', 'Belal', '2000-06-25', 'Naser', '3', 'belalnaser@gmail.com'),
('4002', 'Abo Bakr', '1999-08-08', 'Zyad', '4', 'abo bakrzyad@gmail.com'),
('1003', 'Youssef', '2002-03-15', 'Hesham', '1', 'youssefhesham@gmail.com'),
('2003', 'Marwan', '2001-05-22', 'MoMen', '2', 'marwanmomen@gmail.com'),
('3003', 'Essam', '2000-07-10', 'Eslam', '3', 'essameslam@gmail.com'),
('4003', 'Emad', '1999-09-18', 'Essam', '4', 'emadessam@gmail.com'),
('1004', 'Eslam', '2002-04-28', 'Emad', '1', 'eslamemad@gmail.com'),
('2004', 'MoMen', '2001-06-12', 'Marwan', '2', 'momenmarwan@gmail.com'),
('3004', 'Hesham', '2000-08-25', 'Youssef', '3', 'heshamyoussef@gmail.com'),
('4004', 'Zyad', '1999-10-08', 'Abo Bakr', '4', 'zyadabo bakr@gmail.com'),
('1005', 'Marwa', '2002-05-15', 'Belal', '1', 'marwabelal@gmail.com'),
('2005', 'Nada', '2001-07-20', 'Alaa', '2', 'nadaalaa@gmail.com'),
('3005', 'Aliaa', '2000-09-28', 'Ali', '3', 'aliaaali@gmail.com'),
('4005', 'Rehab', '1999-11-18', 'Mostafa', '4', 'rehabmostafa@gmail.com'),
('1006', 'Eman', '2002-06-28', 'Mahmoud', '1', 'emanmahmoud@gmail.com'),
('2006', 'Reem', '2001-08-10', 'Mohamed', '2', 'reemmohamed@gmail.com'),
('3006', 'Randa', '2000-10-22', 'Ahmed', '3', 'randaahmed@gmail.com'),
('4006', 'Raghda', '1999-12-08', 'Ali', '4', 'raghdaali@gmail.com'),
('1007', 'Nagham', '2002-07-15', 'Marwan', '1', 'naghammarwan@gmail.com'),
('2007', 'Naser', '2001-09-20', 'Belal', '2', 'naserbelal@gmail.com'),
('3007', 'Noor', '2000-11-28', 'Mahmoud', '3', 'noormahmoud@gmail.com'),
('4007', 'Abd Alla', '2000-01-18', 'Ahmed', '4', 'abd allaahmed@gmail.com'),
('1008', 'Abd Alrahman', '2002-08-28', 'Mohamed', '1', 'abd alrahmanmohamed@gmail.com'),
('2008', 'Abd Elrheem', '2001-10-10', 'Noor', '2', 'abd elrheemnoor@gmail.com'),
('3008', 'Nasef', '2000-12-22', 'Naser', '3', 'nasefnaser@gmail.com'),
('4008', 'Nagy', '2000-02-15', 'Nasef', '4', 'nagynasef@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `student_phone`
--

CREATE TABLE `student_phone` (
  `phone_number` varchar(11) NOT NULL,
  `student_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_phone`
--

INSERT INTO `student_phone` (`phone_number`, `student_id`) VALUES
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `Instructor_id` (`Instructor_id`),
  ADD KEY `prerequsite` (`prerequsite`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`Department_id`),
  ADD KEY `Department_head` (`Department_head`);

--
-- Indexes for table `enrolling`
--
ALTER TABLE `enrolling`
  ADD PRIMARY KEY (`enrolling_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `Instructor`
--
ALTER TABLE `Instructor`
  ADD PRIMARY KEY (`Instructor_id`),
  ADD KEY `Department_id` (`Department_id`);

--
-- Indexes for table `Instructor_phone`
--
ALTER TABLE `Instructor_phone`
  ADD PRIMARY KEY (`phone_number`),
  ADD KEY `Instructor_id` (`Instructor_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_phone`
--
ALTER TABLE `student_phone`
  ADD PRIMARY KEY (`phone_number`),
  ADD KEY `student_id` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
