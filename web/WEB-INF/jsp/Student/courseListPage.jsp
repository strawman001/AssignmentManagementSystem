<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--BootStrap设计的页面支持响应式的 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
    <!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
    <!--引入BootStrap的JS的文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <style>
        .course{
            text-align: center;
        }
        .course-img{
            display: inline-block;
            border:5px solid #2b669a;
            border-radius: 50%;
            width: 250px;
            height: 250px;
        }
    </style>
</head>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">导航栏</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#" >我的课程</a>
                        </li>
                        <li>
                            <a href="#">个人中心</a>
                        </li>
                        <li>
                            <a href="#">信息动态</a>
                        </li>
                        <li>
                            <a href="#">发布动态</a>
                        </li>
                    </ul>
                </div>

            </nav>
        </div>
    </div>
    <div id="courseList-container">
    </div>
</div>
<script>
    function getCourseList() {
        $.get(
            "${pageContext.request.contextPath}/getCourseList.action",
            function(data){
                showCourseList(data)
            });
    }
    function showCourseList(data) {
        var courseList = data;
        var length = courseList.length;
        var container = $("#courseList-container");
        var row="";
        var i=0;
        for (i in courseList) {
            var item = courseList[i];
            if (i%3===0){
                if (row!==null)
                    container.append(row);
                row=$("<div class=\"row clearfix\"></div>");
            }
            var coursePic = $("<img class=\"img-rounded course-img\" src=\"${pageContext.request.contextPath}/images/courseImg/"+item.coursePicLocation+"\"/>");
            var courseJump = $("<a id=\""+item.courseID+"\" onclick=\"getCourse(this)\" href=\"${pageContext.request.contextPath}/getCourse.action?courseID="+item.courseID+"\"></a>");
            var courseTitle = $("<h3 onclick='getCourse(this)' >"+item.courseName+"</h3>");
            courseJump.append(courseTitle);
            var courseWarp = $("<div class=\"col-md-4 column course\"></div>");
            courseWarp.append(coursePic);
            courseWarp.append(courseJump);
            row.append(courseWarp);
            if (i==(length-1)){
                container.append(row);
            }
        }
    }
    window.onload=function (ev) {
        getCourseList();
    }
    function getCourse(element) {
        var courseID = $(element).attr('id');
        sessionStorage.setItem("courseID",courseID);
    }
</script>
</html>