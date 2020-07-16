<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
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
        .nav-button{
            border-radius: 50%;
            display: inline-block;
            width: 80px;
            height: 80px;
        }
        .nav-li{
            width: 33%;
            text-align: center;
        }
        .cd-button{
            border-radius: 50%;
            display: inline-block;
            float: right;
            width: 30px;
            height: 30px;
            margin-bottom: 5px;
            margin-right: 5px;
            text-align: center;
        }
        cd-button:focus{
            outline: 0;
        }
        .nav-button:focus{
            outline: 0;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">导航栏</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">我的课程</a>
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
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <ul class="nav nav-tabs">
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseNoticePage.action"><button class="btn btn-info nav-button active" href=>公告</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseResourcePage.action"><button class="btn btn-info nav-button">资源</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goAssignmentProjectPage.action"><button class="btn btn-info nav-button">作业</button></a></li>
            </ul>
            <div>
                <div id="list">

                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
</body>
<script>
    window.onload =function (ev) {
        getCourseNoticeList();
    }

    function getCourseNoticeList() {
        $.get(
            "${pageContext.request.contextPath}/getCourseNoticeList.action",
            function (data) {
                showCourseNotice(data);
            });
    }
    function showCourseNotice(data) {
        var list = $("#list");
        var courseNoticeList = data;
        var length = courseNoticeList.length;
        var i=0;
        for (i in courseNoticeList){
            var item = courseNoticeList[i];
            var courseNoticeFirst = $("<div class=\"panel-group\"></div>");
            var courseNoticeSecond = $("<div class=\"panel panel-default\"></div>");
            courseNoticeFirst.append(courseNoticeSecond);
            var courseNoticeHeadingDiv = $(" <div class=\"panel-heading\" id=\"notice-"+item.courseNoticeID+"\"></div>");
            var courseNoticeHeading=$("<a class=\"panel-title collapsed\" data-toggle=\"collapse\" data-parent=\"#notice-"+item.courseNoticeID+"\" href=\"#notice-content-"+item.courseNoticeID+"\">"+item.courseNoticeTitle+"</a>");
            courseNoticeHeadingDiv.append(courseNoticeHeading);
            var courseNoticeContent = $("<div id=\"notice-content-"+item.courseNoticeID+"\" class=\"panel-collapse collapse\"><div class=\"panel-body\">"+item.courseNoticeContent+"<br />"+item.courseNoticeTime+"</div></div>");
            courseNoticeSecond.append(courseNoticeHeadingDiv);
            courseNoticeSecond.append(courseNoticeContent);
            list.append(courseNoticeFirst);
        }
    }



</script>
</html>
