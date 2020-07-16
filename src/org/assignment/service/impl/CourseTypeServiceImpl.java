package org.assignment.service.impl;

import org.assignment.dao.CourseDao;
import org.assignment.dao.CourseTypeDao;
import org.assignment.po.Course;
import org.assignment.po.CourseType;
import org.assignment.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("courseTypeService")
public class CourseTypeServiceImpl implements CourseTypeService {
    @Autowired
    CourseDao courseDao;
    @Autowired
    CourseTypeDao courseTypeDao;

    @Override
    public CourseType findCourseType(Integer courseID) {
        Course course = courseDao.findCourse(courseID);
        return courseTypeDao.findCourseType(course.getCourseTypeCode());
    }
}
