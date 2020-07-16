package org.assignment.service.impl;

import org.apache.commons.io.FileUtils;
import org.assignment.dao.*;
import org.assignment.po.AssignmentEntity;
import org.assignment.po.AssignmentEntityDoc;
import org.assignment.po.AssignmentProject;
import org.assignment.po.AssignmentProjectDoc;
import org.assignment.service.AssignmentEntityService;
import org.assignment.utils.DateUtils;
import org.assignment.utils.DocumentConverterUtil;
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
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Service("assignmentEntityService")
public class AssignmentEntityServiceImpl implements AssignmentEntityService {
    @Autowired
    AssignmentEntityDao assignmentEntityDao;
    @Autowired
    AssignmentEntityDocDao assignmentEntityDocDao;
    @Autowired
    DocumentTypeDao documentTypeDao;
    @Autowired
    CourseTeacherDao courseTeacherDao;
    @Autowired
    PathUtil pathUtil;
    @Autowired
    DocumentConverterUtil documentConverterUtil;
    @Autowired
    AssignmentProjectDao assignmentProjectDao;
    @Autowired
    AssignmentProjectDocDao assignmentProjectDocDao;
    @Autowired
    DateUtils dateUtils;

    @Override
    public List<AssignmentEntity> getAssignmentEntityList(Integer assignmentProjectID) {
        return assignmentEntityDao.getAssignmentEntityList(assignmentProjectID);
    }

    @Override
    public AssignmentEntity getAssignmentEntityByStudent(Integer assignmentProjectID, String studentCode) {
        System.out.println("ID:"+assignmentProjectID+", Code:"+studentCode);
        return assignmentEntityDao.getAssignmentEntityByStudent(assignmentProjectID,studentCode);
    }

    @Override
    public List<AssignmentEntityDoc> getAssignmentEntityDocList(Integer assignmentEntityID) {
        return assignmentEntityDocDao.getAssignmentEntityDocList(assignmentEntityID);
    }

    @Override
    public String getPreView(Integer assignmentEntityDocID) {
        AssignmentEntityDoc assignmentEntityDoc = assignmentEntityDocDao.getAssignmentEntityDoc(assignmentEntityDocID);
        AssignmentEntity assignmentEntity = assignmentEntityDao.getAssignmentEntity(assignmentEntityDoc.getAssignmentEntityID());
        String preViewName =  ((assignmentEntity.getStudentCode()+assignmentEntityDocID).hashCode())+".pdf";
        File  preViewFile = new File(getWebInfPath()+"cachePDF/"+preViewName);

        if (preViewFile.exists())
            return preViewName;
        else {
            try {
                System.out.println( preViewFile.createNewFile());
            } catch (IOException e) {
                e.printStackTrace();
            }
            documentConverterUtil.docToPDF(assignmentEntityDoc.getAssignmentEntityDocSaveLocation(),preViewFile.getPath());
            assignmentEntityDoc.setHavePreView(true);
            assignmentEntityDoc.setAssignmentEntityDocPreViewSaveLocation(preViewFile.getName());
            assignmentEntityDocDao.updateAssignmentEntityDoc(assignmentEntityDoc);
            return preViewName;
        }

    }

    @Override
    public ResponseEntity<byte[]> downloadAssignmentEntityDocAll(Integer assignmentProjectID) {
        AssignmentProject assignmentProject = assignmentProjectDao.getAssignmentProject(assignmentProjectID);
        int courseID = assignmentProject.getCourseID();
        documentConverterUtil.compress(pathUtil.getAssignmentEntityPath(courseID,assignmentProjectID).getPath(),
                pathUtil.getAllStudentAssignmentZIPPath(courseID,assignmentProjectID).getPath());

        File zipFile =  pathUtil.getAllStudentAssignmentZIPPath(courseID,assignmentProjectID);
        if (zipFile.exists()){
            if (zipFile.isFile()){
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                String fileName="";
                try {
                    fileName = URLEncoder.encode(zipFile.getName(),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                headers.setContentDispositionFormData("attachment", fileName);
                try {
                    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(zipFile),headers, HttpStatus.OK);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public ResponseEntity<byte[]> downloadAssignmentEntityDoc(Integer assignmentEntityDocID) {
        AssignmentEntityDoc assignmentEntityDoc = assignmentEntityDocDao.getAssignmentEntityDoc(assignmentEntityDocID);
        File file = new File(assignmentEntityDoc.getAssignmentEntityDocSaveLocation());
        if (file.exists()){
            if (file.isFile()){
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                String fileName="";
                try {
                    fileName = URLEncoder.encode(file.getName(),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                headers.setContentDispositionFormData("attachment", fileName);
                try {
                    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public Boolean submitAssignmentProjectEntityDoc(Integer assignmentEntityDocID, MultipartFile multipartFile) {
        AssignmentEntityDoc assignmentEntityDoc = assignmentEntityDocDao.getAssignmentEntityDoc(assignmentEntityDocID);
        AssignmentEntity assignmentEntity = assignmentEntityDao.getAssignmentEntity(assignmentEntityDoc.getAssignmentEntityID());
        AssignmentProjectDoc assignmentProjectDoc = assignmentProjectDocDao.getAssignmentProjectDoc(assignmentEntityDoc.getAssignmentProjectDocID());
        AssignmentProject assignmentProject = assignmentProjectDao.getAssignmentProject(assignmentEntity.getAssignmentProjectID());
        int courseID = assignmentProject.getCourseID();
        int assignmentProjectID = assignmentProject.getAssignmentProjectID();
        String studentCode = assignmentEntity.getStudentCode();
        String assignmentProjectDocName = assignmentProjectDoc.getAssignmentProjectDocName();
        try {
            multipartFile.transferTo(pathUtil.getAssignmentEntityDocFile(courseID,assignmentProjectID,studentCode,assignmentProjectDocName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        assignmentEntityDoc.setAssignmentEntityDocState(AssignmentEntityDoc.DOC_SUBMITED);
        int rows = assignmentEntityDocDao.updateAssignmentEntityDoc(assignmentEntityDoc);
        boolean bool1 = rows>0?true:false;
        //时间检查
        String deadline = assignmentProject.getAssignmentProjectDeadLine();
        if (dateUtils.isNowBeforeB(deadline)){
            boolean submitFlag = true;
            for (AssignmentEntityDoc preDoc : assignmentEntityDocDao.getAssignmentEntityDocList(assignmentEntity.getAssignmentEntityID())){
                if (preDoc.getAssignmentEntityDocState()==AssignmentEntityDoc.DOC_NO_SUBMITED){
                    submitFlag = false;
                    break;
                }
            }
            if (submitFlag){
                assignmentEntity.setAssignmentEntityState(AssignmentEntity.DOC_SUBMITED_ONTIME);
                assignmentEntity.setAssignmentEntityTime(dateUtils.getNowTime());
            }else {
                //do nothing;
            }
        }else {
            assignmentEntity.setAssignmentEntityState(AssignmentEntity.DOC_SUBMITED_DELAYTIME);
            assignmentEntity.setAssignmentEntityTime(dateUtils.getNowTime());
        }
        int rows2 =assignmentEntityDao.updateAssignmentEntity(assignmentEntity);
        boolean bool2 = rows2>0?true:false;
        return bool1&&bool2;
    }


    @Override
    public Boolean evalAssignmentEntity(AssignmentEntity assignmentEntity) {
        int row = assignmentEntityDao.updateAssignmentEntity(assignmentEntity);
        if (row>0)
            return true;
        else
            return false;
    }

    @Override
    public List<AssignmentEntityDoc> getAssignmentEntityDocInBufferAllList(Integer assignmentProjectID) {
        return assignmentEntityDocDao.getAssignmentEntityDocInBufferForAll();
    }

    @Override
    public Boolean canPreView(String documentTypeName) {
        return documentTypeDao.getDocumentType(documentTypeName).getPreView();
    }

    @Override
    public AssignmentEntityDoc getAssignmentEntityDoc(Integer assignmentProjectID, Integer assignmentProjectDocID, String studentCode) {
        AssignmentEntity assignmentEntity = assignmentEntityDao.getAssignmentEntityByStudent(assignmentProjectID,studentCode);
        System.out.println("AssignmentEntityID:"+assignmentEntity.getAssignmentEntityID());
        System.out.println("AssignmentProjectDocID:"+assignmentProjectDocID);
        return assignmentEntityDocDao.getAssignmentEntityDocByProjectDoc(assignmentEntity.getAssignmentEntityID(),assignmentProjectDocID);
    }

    public static String getWebInfPath() {
        String webRootPath = AssignmentEntityServiceImpl.class.getResource("/").getPath();
        String webInfPath = webRootPath.substring(0,webRootPath.indexOf("WEB-INF"));
        try {
            return URLDecoder.decode(webInfPath,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
