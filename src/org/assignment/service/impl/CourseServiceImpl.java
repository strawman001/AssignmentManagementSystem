package org.assignment.service.impl;

import org.assignment.dao.*;
import org.assignment.po.Course;
import org.assignment.po.Student;
import org.assignment.po.User;
import org.assignment.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    CourseStudentDao courseStudentDao;
    @Autowired
    CourseTeacherDao courseTeacherDao;
    @Autowired
    UserDao userDao;


    @Override
    public List<Course> findMyCourseList(Integer userID) {
        User user = userDao.findUserByID(userID);
        if (user.getUserType().equals(User.TEACHER)){
            List<Integer> courseIDList = courseTeacherDao.findCourseIDListByTeacher(user.getUserCode());
            List<Course> courseList = new ArrayList<Course>();
            for(Integer courseID : courseIDList){
                Course c=courseDao.findCourse(courseID);
                courseList.add(c);
            }
            return courseList;
        }else if(user.getUserType().equals(User.STUDENT)){
            System.out.println("学生课程列表！");
            List<Integer> courseIDList = courseStudentDao.findCourseIDListByStudent(user.getUserCode());
            List<Course> courseList = new ArrayList<Course>();
            for(Integer courseID : courseIDList)
                courseList.add(courseDao.findCourse(courseID));
            return courseList;
        }else {
            System.out.println(user.getUserType());
            System.out.println(user.getUserType().equals(User.STUDENT));
            List<Course> courseList = new ArrayList<Course>();
            return courseList;
        }

    }

    @Override
    public Course findCourse(Integer courseID) {

        return courseDao.findCourse(courseID);
    }

    @Override
    public Boolean editCourse(Course course) {
        int rows = courseDao.updateCourse(course);
        if (rows>0)
            return true;
        else
             return false;
    }


}
