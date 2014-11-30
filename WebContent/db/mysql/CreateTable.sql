CREATE DATABASE drivingschool;

-- USER表
USE drivingschool;
CREATE TABLE user(
       username VARCHAR(20) PRIMARY KEY UNIQUE NOT NULL,
       password VARCHAR(20) NOT NULL
       );

-- studentInfo表
CREATE TABLE studentInfo(
       sno INT(8) PRIMARY KEY UNIQUE NOT NULL,
       sname VARCHAR(20) NOT NULL,
	   sex  ENUM('男','女') NOT NULL,
       age  INT(3),
       identify VARCHAR(18) UNIQUE NOT NULL,
       tel VARCHAR(15),
       car_type VARCHAR(4) NOT NULL,
	   enroll_time DATE NOT NULL,
       leave_time  DATE,
	   scondition ENUM('学习','结业','退学')NOT NULL,
       s_text TEXT
       );

-- healthInfo表
CREATE TABLE healthInfo(
       id INT(8) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
	   sno INT(8) UNIQUE NOT NULL,
       sname VARCHAR(20) NOT NULL,
       height FLOAT,
	   Weight FLOAT,
	   differentiate  ENUM('正常','色弱','色盲'),
       left_sight FLOAT,
       right_sight FLOAT,
       left_ear ENUM('正常','偏弱'),
       right_ear ENUM('正常','偏弱'),
       legs ENUM('正常','不相等'),
       pressure  ENUM('正常','偏高','偏低'),
	   history  VARCHAR(50),
       h_text TEXT,
       CONSTRAINT health_fk FOREIGN KEY(sno)
       REFERENCES studentInfo(sno)
       );

-- courseInfo表
CREATE TABLE courseInfo(
       cno INT(4) PRIMARY KEY UNIQUE NOT NULL,
       cname VARCHAR(20) NOT NULL UNIQUE,
       before_cour INT(4) NOT NULL DEFAULT 0
       );

-- gradeInfo表
CREATE TABLE gradeInfo(
       id INT(8) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
       sno INT(8) NOT NULL,
       cno INT(4)  NOT NULL,
       last_time DATE,
       times INT(4)  DEFAULT 1,
       grade FLOAT DEFAULT 0,
	   CONSTRAINT grade_sno_fk FOREIGN KEY(sno)
	   REFERENCES studentInfo(sno),
       CONSTRAINT grade_cno_fk FOREIGN KEY(cno)
       REFERENCES courseInfo(cno)
       );

-- licenseInfo表
CREATE TABLE licenseInfo(
       id INT(8) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
       sno INT(8) UNIQUE NOT NULL,
       sname VARCHAR(20) NOT NULL,
	   ino VARCHAR(10) UNIQUE NOT NULL,
       receive_time DATE,
       receive_name VARCHAR(20),
       l_text TEXT,
	   CONSTRAINT course_fk FOREIGN KEY(sno)
	   REFERENCES studentInfo(sno)
       );

