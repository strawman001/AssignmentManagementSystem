package org.assignment.po;

public class DocumentType {
    private Integer documentTypeID;
    private String documentTypeName;
    private Boolean isPreView;

    public Integer getDocumentTypeID() {
        return documentTypeID;
    }

    public void setDocumentTypeID(Integer documentTypeID) {
        this.documentTypeID = documentTypeID;
    }

    public String getDocumentType() {
        return documentTypeName;
    }

    public void setDocumentType(String documentType) {
        this.documentTypeName = documentType;
    }

    public Boolean getPreView() {
        return isPreView;
    }

    public void setPreView(Boolean preView) {
        isPreView = preView;
    }
}
