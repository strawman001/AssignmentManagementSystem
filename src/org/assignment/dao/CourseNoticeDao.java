package org.assignment.dao;

import org.assignment.po.CourseNotice;

import java.util.List;

public interface CourseNoticeDao {
    public Integer addNotice(CourseNotice courseNotice);
    public Integer delNotice(Integer courseNoticeID);
    public Integer updateNotice(CourseNotice courseNotice);
    public List<CourseNotice> findNoticeList(Integer courseID);
}
