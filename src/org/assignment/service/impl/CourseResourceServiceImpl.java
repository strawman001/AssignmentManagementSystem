package org.assignment.service.impl;


import org.apache.commons.io.FileUtils;
import org.assignment.dao.CourseResourceDao;
import org.assignment.po.CourseResource;
import org.assignment.service.CourseResourceService;
import org.assignment.utils.DateUtils;
import org.assignment.utils.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Service("courseResourceService")
public class CourseResourceServiceImpl implements CourseResourceService {
    @Autowired
    CourseResourceDao courseResourceDao;
    @Autowired
    PathUtil pathUtil;
    @Autowired
    DateUtils dateUtils;

    @Override
    public Boolean addCourseResource(CourseResource courseResource,MultipartFile multipartFile) {
        boolean fileBool = submitCourseResource(courseResource.getCourseID(),multipartFile,courseResource.getCourseResourceName());
        if (fileBool){
            courseResource.setSaveLocation(pathUtil.getCourseSourceFile(courseResource.getCourseID(),courseResource.getCourseResourceName()).getPath());
            courseResource.setUploadTime(dateUtils.getNowTime());
        }else
            return false;
        int rows = courseResourceDao.addCourseResource(courseResource);
        boolean dataBool;
        if (rows>0){
            dataBool=true;
        }else {
            dataBool=false;
        }
        return dataBool;
    }

    @Override
    public Boolean submitCourseResource(Integer courseID,MultipartFile multipartFile,String fileName) {
        pathUtil.createCourseSourcePath(courseID);
        System.out.println(pathUtil.getCourseSourceFile(courseID,fileName).getPath());
        try {
            multipartFile.transferTo(pathUtil.getCourseSourceFile(courseID,fileName));
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean delCourseResource(Integer courseResourceID) {
        CourseResource courseResource = courseResourceDao.findCourseResource(courseResourceID);
        int rows = courseResourceDao.delCourseResource(courseResourceID);
        boolean dataBool;
        if (rows>0){
            dataBool=true;
        }else {
            dataBool=false;
        }

        File file = new File(courseResource.getSaveLocation());
        if (file.exists()){
            if (file.isFile())
                file.delete();
            else
                return false;
        }else
            return false;

        return dataBool;
    }


    @Override
    public List<CourseResource> findCourseResource(Integer courseID) {
        return courseResourceDao.findCourseResourceList(courseID);
    }

    @Override
    public ResponseEntity<byte[]> downloadCourseResource(Integer courseResourceID) {
        CourseResource courseResource = courseResourceDao.findCourseResource(courseResourceID);
        File thisCourseResourceEntity = new File(courseResource.getSaveLocation());
        if (thisCourseResourceEntity.exists()){
            if (thisCourseResourceEntity.isFile()){
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                String fileName="";
                try {
                    fileName = URLEncoder.encode(thisCourseResourceEntity.getName(),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                headers.setContentDispositionFormData("attachment", fileName);
                try {
                    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(thisCourseResourceEntity),headers, HttpStatus.OK);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
}
