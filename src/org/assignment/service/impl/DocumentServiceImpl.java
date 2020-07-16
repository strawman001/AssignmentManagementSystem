package org.assignment.service.impl;

import org.assignment.dao.DocumentTypeDao;
import org.assignment.po.DocumentType;
import org.assignment.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("documentService")
public class DocumentServiceImpl implements DocumentService {
    @Autowired
    DocumentTypeDao documentTypeDao;

    @Override
    public List<DocumentType> getDocumentTypeAll() {
        return documentTypeDao.getDocumentTypeListAll();
    }

    @Override
    public DocumentType getDocumentType(String documentTypeName) {
        return documentTypeDao.getDocumentType(documentTypeName);
    }
}
