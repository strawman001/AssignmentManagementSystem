package org.assignment.utils;


import java.io.File;
import java.io.IOException;
import java.util.Properties;

public class PathUtil {
    private String path="";
    public PathUtil(){
        Properties properties = new Properties();
        try {
            properties.load(getClass().getClassLoader().getResourceAsStream("document.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        path = properties.getProperty("PATH");
        System.out.println("path:"+path);
    }

    public File getCourseSourcePath(Integer courseID){
        return new File(path+"/"+courseID+"/courseResource");
    }

    public File createCourseSourcePath(Integer courseID){
        File file = new File(path+"/"+courseID+"/courseResource");
        if (!file.exists())
            file.mkdirs();
        return file;
    }

    public File getCourseSourceFile(Integer courseID,String courseResourceName){
        return new File(path+"/"+courseID+"/courseResource/"+courseResourceName);
    }

    public File getAssignmentEntityPathByStudent(Integer courseID,Integer assignmentProjectID,String studentCode,String assignmentProjectDocName){
        return new File(path+"/"+courseID+"/assignment/"+assignmentProjectID+"/"+studentCode+"/"+assignmentProjectDocName);
    }

    public File createAssignmentEntityPath(Integer courseID,Integer assignmentProjectID,String studentCode){
        File file = new File(path+"/"+courseID+"/assignment/"+assignmentProjectID+"/"+studentCode);
        if (!file.exists())
            file.mkdirs();
        return file;
    }

    public File getAssignmentEntityDocFile(Integer courseID,Integer assignmentProjectID,String studentCode,String assignmentProjectDocName){
        return new File(path+"/"+courseID+"/assignment/"+assignmentProjectID+"/"+studentCode+"/"+assignmentProjectDocName);
    }

    public File getAssignmentEntityPath(Integer courseID,Integer assignmentProjectID){
        return new File(path+"/"+courseID+"/assignment/"+assignmentProjectID);
    }

    public File getAllStudentAssignmentZIPPath(Integer courseID,Integer assignmentProjectID){
        return new File(path+"/"+courseID+"/assignment/"+assignmentProjectID+".zip");
    }

    public void deleteFile(File file){
        if(!file.exists())
            return;
        if (file.isFile()){//判断是否为文件，是，则删除
           // System.out.println(file.getAbsoluteFile());//打印路径
            file.delete();
        }else{//不为文件，则为文件夹
            String[] childFilePath = file.list();//获取文件夹下所有文件相对路径
            for (String path:childFilePath){
                File childFile= new File(file.getAbsoluteFile()+"/"+path);
                deleteFile(childFile);//递归，对每个都进行判断
            }
            file.delete();
        }

    }
}
