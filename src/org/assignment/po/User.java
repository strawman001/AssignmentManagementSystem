package org.assignment.po;

public class User {
    private Integer userID;
    private String userName;
    private String password;
    private String userType;
    private String userCode;
    public final static String TEACHER = "TYPE_TEACHER";
    public final static String STUDENT = "TYPE_STUDENT";

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String toString(){
        return "User [userName="+userName+",password="+password+"]";
    }
}
