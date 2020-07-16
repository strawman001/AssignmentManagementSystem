package org.assignment.service;

import org.assignment.po.DocumentType;

import java.util.List;

public interface DocumentService {
    public List<DocumentType> getDocumentTypeAll();
    public DocumentType getDocumentType(String documentTypeName);
}
