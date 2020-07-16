package org.assignment.service;

import org.assignment.po.Course;
import org.assignment.po.CourseNotice;

import java.util.List;

public interface CourseNoticeService {
    public Boolean addCourseNotice(CourseNotice courseNotice);
    public Boolean delCourseNotice(Integer courseNoticeID);
    public Boolean editCourseNotice(CourseNotice courseNotice);
    public List<CourseNotice> findCourseNotice(Integer courseID);

}
