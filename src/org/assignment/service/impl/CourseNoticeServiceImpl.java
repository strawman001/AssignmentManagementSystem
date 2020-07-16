package org.assignment.service.impl;

import org.assignment.dao.CourseNoticeDao;
import org.assignment.po.CourseNotice;
import org.assignment.service.CourseNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("courseNoticeService")
public class CourseNoticeServiceImpl implements CourseNoticeService {
    @Autowired
    CourseNoticeDao courseNoticeDao;

    @Override
    public Boolean addCourseNotice(CourseNotice courseNotice) {
        int rows = courseNoticeDao.addNotice(courseNotice);
        if (rows>0)
            return true;
        else
            return false;
    }

    @Override
    public Boolean delCourseNotice(Integer courseNoticeID) {
        int rows = courseNoticeDao.delNotice(courseNoticeID);
        if (rows>0)
            return true;
        else
            return false;
    }

    @Override
    public Boolean editCourseNotice(CourseNotice courseNotice) {
        int rows = courseNoticeDao.updateNotice(courseNotice);
        if (rows>0)
            return true;
        else
            return false;
    }

    @Override
    public List<CourseNotice> findCourseNotice(Integer courseID) {
        return courseNoticeDao.findNoticeList(courseID);
    }
}
