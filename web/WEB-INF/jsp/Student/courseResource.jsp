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
        .nav-button:focus{
            outline: 0;
        }
        .nav-li{
            width: 33%;
            text-align: center;
        }
        #add-button{
            border-radius: 50%;
            display: inline-block;
        }
        #add-button:focus{
            outline: 0;
        }
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
        .upload-time{
            display: inline-block;
            float: right;
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
        .cd-button:focus{
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
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseNoticePage.action"><button class="btn btn-info nav-button" href=>公告</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseResourcePage.action"><button class="btn btn-info nav-button active">资源</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goAssignmentProjectPage.action"><button class="btn btn-info nav-button">作业</button></a></li>
            </ul>
            <div>
                <div id="list"></div>
                <div id="add"></div>
                <div id="update"></div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
</body>
<script>
    window.onload =function (ev) {
        getCourseResourceList();

    }


    function getCourseResourceList() {
        $("#list").text("");
        $.get(
            "${pageContext.request.contextPath}/getCourseResourceList.action",
            function (data) {
                showCourseResource(data);
            });
    }

    function showCourseResource(data) {
        var list = $("#list");
        var courseResourceList = data;
        var length = courseResourceList.length;
        var i=0;
        for (i in courseResourceList){
            var item = courseResourceList[i];
            var courseResourcePanel=$("<div class=\"panel panel-primary\"></div>");
            var courseResourceBody=$("<div class=\"panel-body\"><span>"+item.courseResourceName+"</span><span class='upload-time'>"+item.uploadTime+"</span>" +
                "<a href=\"${pageContext.request.contextPath}/downloadCourseResource.action?courseResourceID="+item.courseResourceID+"\"><button class='btn btn-success cd-button' id=\"download-courseResource-button-"+item.courseResourceID+"\" >↓</button></a>");
            courseResourcePanel.append(courseResourceBody);
            list.append(courseResourcePanel);
        }
    }




    <%--
    <form action="${pageContext.request.contextPath}/addCourseResource.action" method="post" enctype="multipart/form-data">
        请选择文件：<input id="addCourseResourceInput" type="file" name="uploadfile"/><br/></form>

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
                var courseNoticeChange=$("<button class=\"btn btn-warning cd-button\" id=\"update-button-"+item.courseNoticeID+"\" href=\"#updateCourseNotice\" data-toggle=\"modal\" onclick='showUpdateCourseNotice(this)'>改</button>");
                var courseNoticeDelete=$("<button class=\"btn btn-danger cd-button\" id=\"delete-button-"+item.courseNoticeID+"\" href=\"#deleteCourseNotice\" data-toggle=\"modal\" onclick='sendDeleteCourseNotice(this)'>-</button>");
                courseNoticeHeadingDiv.append(courseNoticeHeading);
                courseNoticeHeadingDiv.append(courseNoticeChange);
                courseNoticeHeadingDiv.append(courseNoticeDelete);
                var courseNoticeContent = $("<div id=\"notice-content-"+item.courseNoticeID+"\" class=\"panel-collapse collapse\"><div class=\"panel-body\">"+item.courseNoticeContent+"<br />"+item.courseNoticeTime+"</div></div>");
                courseNoticeSecond.append(courseNoticeHeadingDiv);
                courseNoticeSecond.append(courseNoticeContent);
                list.append(courseNoticeFirst);
            }
        }

        function showAddCourseNotice() {
            var add = $("#add");
            var model = $(" <div class=\"modal fade\" id=\"addCourseNotice\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
            var modelDialog = $(" <div class=\"modal-dialog\"></div>");
            model.append(modelDialog);
            var modelContent = $("<div class=\"modal-content\"></div>");
            modelDialog.append(modelContent);
            var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">添加课程公告</h2></div>");
            var modelBody = $(" <form><div class=\"form-group\"><label for=\"addNoticeTitle\">公告标题</label><input type=\"text\" class=\"form-control\" id=\"addNoticeTitle\">" +
                "</div><div class=\"form-group\"><label for=\"addNoticeContent\">公告内容</label><textarea class=\"form-control\" rows=\"8\" id=\"addNoticeContent\"></textarea></div></form>");
            var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick='sendAddCourseNotice()'>保存</button>" +
                "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
            modelContent.append(modelHeader,modelBody,modelFooter);
            add.append(model);
        }

        function clearAddCourseNotice() {
            $("#addNoticeTitle").text("");
            $("#addNoticeContent").text("");
        }

        function sendAddCourseNotice() {
            var noticeTitle = $.trim($("#addNoticeTitle").val());
            var noticeContent = $.trim($("#addNoticeContent").val());
            clearAddCourseNotice();
            var courseID = sessionStorage.getItem("courseID");
            console.log("发送添加请求！");
            $.ajax({
                url:"${pageContext.request.contextPath}/addCourseNotice.action",
                type:"post",
                data:JSON.stringify({courseID:courseID,courseNoticeTitle:noticeTitle,courseNoticeContent:noticeContent}),
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function (data) {
                    if(data==true){
                        $("#list").text("");
                        getCourseNoticeList();
                    }

                }
            })

        }

        function sendDeleteCourseNotice(element) {
            var elementID = $(element).attr("id");
            var id = elementID.slice(elementID.search(/\d+/));
            $.ajax({
                url:"${pageContext.request.contextPath}/delCourseNotice.action",
                type:"get",
                data:"courseNoticeID="+id,
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function (data) {
                    if(data==true){
                        $("#list").text("");
                        getCourseNoticeList();
                    }
                }

            })
        }

        function showUpdateCourseNotice(element) {
            clearUpdate();
            var elementID = $(element).attr("id");
            var id = elementID.slice(elementID.search(/\d+/));
            var update = $("#update");
            var model = $(" <div class=\"modal fade\" id=\"updateCourseNotice\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
            var modelDialog = $(" <div class=\"modal-dialog\"></div>");
            model.append(modelDialog);
            var modelContent = $("<div class=\"modal-content\"></div>");
            modelDialog.append(modelContent);
            var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">更改课程公告内容</h2></div>");
            var modelBody = $(" <form>" +
                "<div class=\"form-group\"><label for=\"updateNoticeContent\">公告内容</label><textarea class=\"form-control\" rows=\"8\" id=\"updateNoticeContent\"></textarea></div></form>");
            var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick=\"sendUpdateCourseNotice(this)\" id=\"update-button-"+id+"\">保存</button>" +
                "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
            modelContent.append(modelHeader,modelBody,modelFooter);
            update.append(model);
        }

        function sendUpdateCourseNotice(element) {
            var elementID = $(element).attr("id");
            var id = elementID.slice(elementID.search(/\d+/));
            var content = $("#updateNoticeContent").val();

            $.ajax({
                url:"${pageContext.request.contextPath}/modCourseNotice.action",
                type:"post",
                data:JSON.stringify({courseNoticeID:id,courseNoticeContent:content}),
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function (data) {
                    alert(data);
                    if(data==true){
                        $("#list").text("");
                        getCourseNoticeList();
                        $("#update").text("");
                    }
                }
            })
        }

        function clearUpdate() {
            $("#update").text("");
        }
        --%>
</script>
</html>
