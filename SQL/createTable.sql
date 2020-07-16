

CREATE TABLE User_table
(
	userID int  AUTO_INCREMENT,
	userName varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	userType varchar(255) NOT NULL,
	userCode varchar(255) NOT NULL,
	PRIMARY KEY (userID)
);

CREATE TABLE Teacher_table
(
	teacherID int AUTO_INCREMENT,
	collegeCode varchar(255) NOT NULL,
	teacherName varchar(255) NOT NULL,
	teacherCode varchar(255) NOT NULL,
	PRIMARY KEY(teacherID)
);

CREATE TABLE Student_table
(
	studentID int AUTO_INCREMENT,
	studentName varchar(255) NOT NULL,
	studentCode varchar(255) NOT NULL,
	majorCode varchar(255) NOT NULL,
	classCode varchar(255) NOT NULL,
	grade int,
	PRIMARY KEY(studentID)
);

CREATE TABLE DocumentType_table
(
	documentTypeID int AUTO_INCREMENT,
	documentTypeName varchar(255) NOT NULL,
	isPreView boolean  NOT NULL,
	PRIMARY KEY(documentTypeID)
);

CREATE TABLE CourseType_table
(
	courseTypeID int AUTO_INCREMENT,
	courseTypeCode varchar(255) NOT NULL,
	courseName varchar(255) NOT NULL,
	coursePeriod varchar(255),
	majorCode varchar(255) NOT NULL,
	courseType varchar(255),
	courseInfo varchar(255),
	coursePicLocation varchar(255),
	PRIMARY KEY(courseTypeID)
);

CREATE TABLE CourseTeacher_table
(
	courseTeacherID int AUTO_INCREMENT,
	courseID int NOT NULL,
	teacherCode varchar(255) NOT NULL,
	courseEvaluation varchar(255),
	PRIMARY KEY(courseTeacherID)
);

CREATE TABLE CourseStudent_table
(
	courseStudentID int AUTO_INCREMENT,
	courseID int NOT NULL,
	studentCode varchar(255) NOT NULL,
	courseMark varchar(255),
	PRIMARY KEY(courseStudentID)
);

CREATE TABLE CourseResource_table
(
	courseResourceID int AUTO_INCREMENT,
	courseID int NOT NULL,
	courseResourceName varchar(255) NOT NULL UNIQUE,
	documentType varchar(255) NOT NULL,
	uploadTime varchar(255) NOT NULL,
	courseResourceSaveLocation varchar(255) NOT NULL,
	PRIMARY KEY(courseResourceID,courseResourceName)
);

CREATE TABLE CourseNotice_table
(
	courseNoticeID int AUTO_INCREMENT,
	courseID int NOT NULL,
	courseNoticeTitle varchar(255) NOT NULL,
	courseNoticeTime varchar(255) NOT NULL,
	courseNoticeContent text NOT NULL,
	PRIMARY KEY(courseNoticeID)
);

CREATE TABLE Course_table
(
	courseID int AUTO_INCREMENT,
	courseTypeCode varchar(255) NOT NULL,
	courseLocation varchar(255) ,
	courseTime varchar(255) ,
	courseBeginTime varchar(255),
	courseIntro varchar(255),
	courseRequirement varchar(255),
	courseScoreFormula varchar(255),
	courseName varchar(255)NOT NULL,
	coursePicLocation varchar(255),
	PRIMARY KEY(courseID)
);

CREATE TABLE AssignmentEntity_table
(
	assignmentEntityID int AUTO_INCREMENT,
	assignmentProjectID int NOT NULL,
	studentCode varchar(255) NOT NULL,
	assignmentEntityScore int ,
	assignmentEntityComment varchar(3000),
	assignmentEntityTime varchar(255),
	assignmentEntityState int NOT NULL,
	PRIMARY KEY(assignmentEntityID)
);

CREATE TABLE AssignmentEntityDoc_table
(
	assignmentEntityDocID int AUTO_INCREMENT,
	assignmentEntityID int NOT NULL,
	assignmentProjectDocID int NOT NULL,
	assignmentEntityDocSaveLocation varchar(255) NOT NULL,
	assignmentEntityDocState int NOT NULL,
	documentType varchar(255) NOT NULL,
	isHavePreView boolean NOT NULL,
	assignmentEntityDocPreViewSaveLocation varchar(600),
	PRIMARY KEY(assignmentEntityDocID)
);

CREATE TABLE AssignmentProject_table
(
	assignmentProjectID int,
	courseID int NOT NULL,
	assignmentProjectName varchar(255) NOT NULL UNIQUE,
	assignmentProjectInfo text,
	assignmentProjectProportion int,
	assignmentProjectDeadLine varchar(255) NOT NULL,
	PRIMARY KEY(assignmentProjectID)
);

CREATE TABLE AssignmentProjectDoc_table
(
	assignmentProjectDocID int,
	documentType varchar(255) NOT NULL,
	assignmentProjectID int NOT NULL,
	assignmentProjectDocName varchar(255) NOT NULL,
	PRIMARY KEY(assignmentProjectDocID)
);