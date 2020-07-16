package org.assignment.dao;

import org.assignment.po.DocumentType;

import java.util.List;

public interface DocumentTypeDao {
    public DocumentType getDocumentType(String documentTypeName);
    public List<DocumentType> getDocumentTypeListAll();

}
