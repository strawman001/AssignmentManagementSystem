package org.assignment.service;

import org.assignment.po.AssignmentEntity;
import org.assignment.po.AssignmentEntityDoc;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AssignmentEntityService {
    public List<AssignmentEntity> getAssignmentEntityList(Integer assignmentProjectID);
    public AssignmentEntity getAssignmentEntityByStudent(Integer assignmentProjectID,String studentCode);
    public List<AssignmentEntityDoc> getAssignmentEntityDocList(Integer assignmentEntityID);
    public String getPreView(Integer assignmentEntityDocID);
    public ResponseEntity<byte[]> downloadAssignmentEntityDocAll(Integer assignmentProjectID);
    public ResponseEntity<byte[]> downloadAssignmentEntityDoc(Integer assignmentEntityDocID);
    public Boolean submitAssignmentProjectEntityDoc(Integer assignmentEntityDocID, MultipartFile multipartFile);
    public Boolean evalAssignmentEntity(AssignmentEntity assignmentEntity);
    public List<AssignmentEntityDoc> getAssignmentEntityDocInBufferAllList(Integer assignmentProjectID);
    public Boolean canPreView(String documentType);
    public AssignmentEntityDoc getAssignmentEntityDoc(Integer assignmentProjectID,Integer assignmentProjectDocID,String studentCode);
}
