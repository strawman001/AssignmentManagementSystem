package org.assignment.po;

public class AssignmentEntityDoc {
    private Integer assignmentEntityDocID;
    private Integer assignmentEntityID;
    private Integer assignmentProjectDocID;
    private String assignmentEntityDocSaveLocation;
    private Integer assignmentEntityDocState;//0未提交 1已提交
    private String documentType;//.pdf .docx/.doc .c .java ....
    private Boolean isHavePreView;
    private String assignmentEntityDocPreViewSaveLocation;

    public static final int DOC_SUBMITED = 1;
    public static final int DOC_NO_SUBMITED = 0;

    public Integer getAssignmentProjectDocID() {
        return assignmentProjectDocID;
    }

    public void setAssignmentProjectDocID(Integer assignmentProjectDocID) {
        this.assignmentProjectDocID = assignmentProjectDocID;
    }

    public Integer getAssignmentEntityDocID() {
        return assignmentEntityDocID;
    }

    public void setAssignmentEntityDocID(Integer assignmentEntityDocID) {
        this.assignmentEntityDocID = assignmentEntityDocID;
    }

    public Integer getAssignmentEntityID() {
        return assignmentEntityID;
    }

    public void setAssignmentEntityID(Integer assignmentEntityID) {
        this.assignmentEntityID = assignmentEntityID;
    }

    public String getAssignmentEntityDocSaveLocation() {
        return assignmentEntityDocSaveLocation;
    }

    public void setAssignmentEntityDocSaveLocation(String assignmentEntityDocSaveLocation) {
        this.assignmentEntityDocSaveLocation = assignmentEntityDocSaveLocation;
    }

    public Integer getAssignmentEntityDocState() {
        return assignmentEntityDocState;
    }

    public void setAssignmentEntityDocState(Integer assignmentEntityDocState) {
        this.assignmentEntityDocState = assignmentEntityDocState;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public Boolean getHavePreView() {
        return isHavePreView;
    }

    public void setHavePreView(Boolean havePreView) {
        isHavePreView = havePreView;
    }

    public String getAssignmentEntityDocPreViewSaveLocation() {
        return assignmentEntityDocPreViewSaveLocation;
    }

    public void setAssignmentEntityDocPreViewSaveLocation(String assignmentEntityDocPreViewSaveLocation) {
        this.assignmentEntityDocPreViewSaveLocation = assignmentEntityDocPreViewSaveLocation;
    }
}
