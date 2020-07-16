package org.assignment.service.impl;

import org.assignment.dao.CourseDao;
import org.assignment.dao.CourseStudentDao;
import org.assignment.dao.StudentDao;
import org.assignment.po.Course;
import org.assignment.po.Student;
import org.assignment.service.CourseStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("courseStudentService")
public class CourseStudentServiceImpl implements CourseStudentService {
    @Autowired
    CourseStudentDao courseStudentDao;
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;

    @Override
    public List<Student> findStudentByCourse(Integer courseID) {
        List<String> studentCodeList = courseStudentDao.findStudentCodeListByCourse(courseID);
        List<Student> studentList = new ArrayList<Student>();
        for (String studentCode : studentCodeList){
            studentList.add(studentDao.findStudent(studentCode));
        }
        return studentList;

    }

    @Override
    public List<Course> findCourseByStudent(String studentCode) {
        List<Integer> courseIDList = courseStudentDao.findCourseIDListByStudent(studentCode);
        List<Course> courseList = new ArrayList<Course>();
        for(Integer courseID : courseIDList)
            courseList.add(courseDao.findCourse(courseID));
        return courseList;

    }
}
