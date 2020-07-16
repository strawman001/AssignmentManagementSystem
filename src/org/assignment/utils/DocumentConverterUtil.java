package org.assignment.utils;

import org.assignment.utils.documentUtils.DocPDF;
import org.assignment.utils.documentUtils.ZIPCompress;

public class DocumentConverterUtil {
    public void docToPDF(String address,String target){
        DocPDF.docToPdf(address,target);
    }

    public void compress(String address,String target){
        ZIPCompress.zipFiles(address,target);
    }


}

