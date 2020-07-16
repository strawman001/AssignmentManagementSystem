package org.assignment.service.impl;

import org.assignment.dao.CourseDao;
import org.assignment.dao.CourseTeacherDao;
import org.assignment.po.Course;
import org.assignment.service.CourseTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("courseTeacherService")
public class CourseTeacherServiceImpl implements CourseTeacherService {
    @Autowired
    CourseTeacherDao courseTeacherDao;
    @Autowired
    CourseDao courseDao;

    @Override
    public List<Course> findCourseByTeacher(String teacherCode) {
        List<Integer> courseIDList = courseTeacherDao.findCourseIDListByTeacher(teacherCode);
        List<Course> courseList = new ArrayList<Course>();
        for(Integer courseID : courseIDList)
            courseList.add(courseDao.findCourse(courseID));
        return courseList;
    }
}
