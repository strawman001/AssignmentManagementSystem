
INSERT INTO User_table(userName,password,userType,userCode)
VALUES
("student1","123456","TYPE_STUDENT","001"),
("student2","123456","TYPE_STUDENT","002"),
("teacher1","123456","TYPE_TEACHER","0001");

INSERT INTO Course_table(courseTypeCode,courseName,coursePicLocation)
VALUES
("1","计算机网络","1.jpg"),
("2","软件工程","2.jpg"),
("3","安卓开发","3.jpg"),
("4","J2EE","4.jpg");

INSERT INTO CourseTeacher_table(courseID,teacherCode)
VALUES
("1","0001"),
("2","0001"),
("3","0001"),
("4","0001");

INSERT INTO CourseNotice_table(courseID,courseNoticeTitle,courseNoticeTime,courseNoticeContent)
VALUES
(4,"测试样例1","2019-12-21 01:46:55","!!Word阿达大大大!!!!!!!!!!!!!!!!!!!!!!!!!"),
(4,"测试样例2","2019-12-11 01:46:55","???????????????????????????????????"),
(4,"测试样例3","2019-12-21 11:46:55","jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");

INSERT INTO CourseStudent_table(courseID,studentCode)
VALUES
("1","001"),
("2","001"),
("3","001"),
("4","001"),
("1","002"),
("2","002"),
("3","002"),
("4","002");

INSERT INTO DocumentType_table(documentTypeName, isPreView)
VALUES
(".txt",false),
(".doc",true),
(".docx",true);

INSERT INTO Student_table(studentName,studentCode,majorCode,classCode)
VALUES
("李林泽","001","1","1"),
("刘卓灵","002","1","1");


