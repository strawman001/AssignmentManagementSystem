<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
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
        .nav-button{
            border-radius: 50%;
            display: inline-block;
            width: 80px;
            height: 80px;
        }
        .nav-li{
            width: 20%;
            text-align: center;
        }
        #add-button{
            border-radius: 50%;
            display: inline-block;
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
        #add-button:focus{
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
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseNoticePage.action"><button class="btn btn-info nav-button" href=>公告</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseResourcePage.action"><button class="btn btn-info nav-button">资源</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goAssignmentProjectPage.action"><button class="btn btn-info nav-button active">作业</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseNoticePage.action"><button class="btn btn-info nav-button">课程管理</button></a></li>
                <li class="nav-li"><a href="${pageContext.request.contextPath}/goCourseNoticePage.action"><button class="btn btn-info nav-button">班级管理</button></a></li>
            </ul>
            <div>
                <div class="panel">
                    <div class="panel-body">
                        <button class="btn btn-info" id="add-button" href="#addAssignmentProject" data-toggle="modal">+</button>
                    </div>
                </div>
                <div id="list"></div>
                <div id="addProject"></div>
                <div id="addDoc"></div>
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
        getAssignmentProjectList();
        showAddAssignmentProject();
        showAddAssignmentProjectDoc();
    }

    function showAddAssignmentProject() {
        var add = $("#addProject");
        var model = $(" <div class=\"modal fade\" id=\"addAssignmentProject\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
        var modelDialog = $(" <div class=\"modal-dialog\"></div>");
        model.append(modelDialog);
        var modelContent = $("<div class=\"modal-content\"></div>");
        modelDialog.append(modelContent);
        var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">添加作业</h2></div>");
        var modelBody = $("<form><div class=\"form-group\"><label for=\"addAssignmentProjectTitle\">作业标题</label><input type=\"text\" class=\"form-control\" id=\"addAssignmentProjectTitle\">" +
            "</div><div class=\"form-group\"><label for=\"addAssignmentProjectContent\">作业说明</label><textarea class=\"form-control\" rows=\"8\" id=\"addAssignmentProjectContent\"></textarea></div>" +
            "<div class=\"form-group\"><label for=\"addAssignmentProjectDeadLine\">作业截止日期</label><input type=\"date\" class=\"form-control\" id=\"addAssignmentProjectDeadLine\"></div>" +
            "<div class=\"form-group\"><label for=\"addAssignmentProjectProportion\">作业分值占比(%)</label><input type=\"number\" min='0' max='100' step='5' class=\"form-control\" id=\"addAssignmentProjectProportion\"></div></form>");
        var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick='sendAddAssignmentProject()'>提交</button>" +
            "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
        modelContent.append(modelHeader,modelBody,modelFooter);
        add.append(model);
    }

    function clearAddAssignmentProject() {
        $("#addAssignmentProjectTitle").text("");
        $("#addAssignmentProjectContent").text("");
        $("#addAssignmentProjectDeadLine").text("");
        $("#addAssignmentProjectProportion").text("");

    }

    function sendAddAssignmentProject() {
        var assignmentProjectTitle = $("#addAssignmentProjectTitle").val();
        var assignmentProjectContent = $("#addAssignmentProjectContent").val();
        var assignmentProjectDeadLine = $("#addAssignmentProjectDeadLine").val();
        var assignmentProjectProportion = $("#addAssignmentProjectProportion").val();
        var courseID = sessionStorage.getItem("courseID");
        var assignmentProject = {
            courseID:courseID,
            assignmentProjectName:assignmentProjectTitle,
            assignmentProjectInfo:assignmentProjectContent,
            assignmentProjectDeadLine:assignmentProjectDeadLine,
            assignmentProjectProportion:assignmentProjectProportion
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/addAssignmentProject.action",
            type:"post",
            data:JSON.stringify(assignmentProject),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
                if(data==true){
                    alert("添加成功！");
                    clearAddAssignmentProject();
                    getAssignmentProjectList();
                }
            },
            error:function () {
                alert("添加错误！请注意是否添加了同名作业")
            }
        })
    }

    function getAssignmentProjectList() {
        $("#list").text("");
        $.get(
            "${pageContext.request.contextPath}/getAssignmentProjectList.action",
            function (data) {
                showAssignmentProject(data);
            });
    }

    function showAssignmentProject(data) {
        var list = $("#list");
        var assignmentProjectList = data;
        var length = assignmentProjectList.length;
        var i=0;
        for (i in assignmentProjectList){
            var item = assignmentProjectList[i];
            var assignmentProjectFirst = $("<div class=\"panel-group\"></div>");
            var assignmentProjectSecond = $("<div class=\"panel panel-default\"></div>");
            assignmentProjectFirst.append(assignmentProjectSecond);
            var assignmentProjectHeadingDiv = $(" <div class=\"panel-heading\" id=\"assignmentProject-"+item.assignmentProjectID+"\"></div>");
            var assignmentProjectHeading=$("<a class=\"panel-title collapsed\" data-toggle=\"collapse\" data-parent=\"#assignmentProject-"+item.assignmentProjectID+"\" href=\"#assignmentProject-content-"+item.assignmentProjectID+"\" onclick='getAssignmentProjectDocListByClick(this)' id=\"assignmentProject-parent-"+item.assignmentProjectID+"\">"+item.assignmentProjectName+"</a>");
            var assignmentProjectChange=$("<button class=\"btn btn-warning cd-button \" id=\"update-button-"+item.assignmentProjectID+"\" href=\"#updateassignmentProject\" data-toggle=\"modal\" onclick='showUpdateAssignmentProject(this)'>改</button>");
            var assignmentProjectDelete=$("<button class=\"btn btn-danger cd-button \" id=\"delete-button-"+item.assignmentProjectID+"\" href=\"#deleteassignmentProject\" data-toggle=\"modal\" onclick='sendDeleteAssignmentProject(this)'>-</button>");
            var assignmentProjectView=$("<a href=\"${pageContext.request.contextPath}/getAssignmentEntityPage.action?assignmentProjectID="+item.assignmentProjectID+"\" onclick=\"saveAssignmentProjectID(this)\" id=\"a-view-"+item.assignmentProjectID+"\"><button class=\"btn btn-primary cd-button \" id=\"view-button-"+item.assignmentProjectID+"\"  data-toggle=\"modal\" >V</button></a>");
            var assignmentProjectDownload=$("<a href=\"${pageContext.request.contextPath}/downloadAssignmentEntityDocAll.action?assignmentProjectID="+item.assignmentProjectID+"\"><button class=\"btn btn-success cd-button \" id=\"download-button-"+item.assignmentProjectID+"\"  data-toggle=\"modal\" >↓</button></a>");
            assignmentProjectHeadingDiv.append(assignmentProjectHeading,assignmentProjectChange,assignmentProjectDelete,assignmentProjectView,assignmentProjectDownload);
            var assignmentProjectContent = $("<div id=\"assignmentProject-content-"+item.assignmentProjectID+"\" class=\"panel-collapse collapse\"></div>");
            var assignmentProjectInfo=$("<div class=\"panel-body\" id=\"#assignmentProject-info-"+item.assignmentProjectID+"\"><p>"+item.assignmentProjectInfo+"</p></div>");
            var assignmentProjectDocAddButton=$("<div class=\"panel-group\"><div class='panel panel-warning'><div class='panel-heading'>增加需要提交的文档<button class='btn btn-info cd-button' id='assignmentProjectDoc-add-button-"+item.assignmentProjectID+"' onclick='useAddAssignmentProjectDoc(this)'>+</button><div></div></div>");
            var assignmentProjectDocList=$("<div class=\"panel-group\" id=\"assignmentProjectDoc-list-"+item.assignmentProjectID+"\"></div>");
            assignmentProjectContent.append(assignmentProjectInfo);
            assignmentProjectContent.append(assignmentProjectDocAddButton);
            assignmentProjectContent.append(assignmentProjectDocList);
            assignmentProjectSecond.append(assignmentProjectHeadingDiv);
            assignmentProjectSecond.append(assignmentProjectContent);
            list.append(assignmentProjectFirst);
        }
    }
    
    function showAddAssignmentProjectDoc() {
        var add = $("#addDoc");
        var model = $(" <div class=\"modal fade\" id=\"addAssignmentProjectDoc\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
        var modelDialog = $(" <div class=\"modal-dialog\"></div>");
        model.append(modelDialog);
        var modelContent = $("<div class=\"modal-content\"></div>");
        modelDialog.append(modelContent);
        var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">添加作业需要提交的文件</h2></div>");
        var modelBody = $("<form><div class=\"form-group\"><label for=\"addAssignmentProjectDocTitle\">文档标题</label><input type=\"text\" class=\"form-control\" id=\"addAssignmentProjectDocTitle\">" +
                "<label for=\"addAssignmentProjectDocDocumentType\">文档类型</label><input type=\"text\" class=\"form-control\" id=\"addAssignmentProjectDocDocumentType\"></div></form>");
        var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick='sendAddAssignmentProjectDoc(this)' id='submitAssignmentProjectDoc'>提交</button>" +
            "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" onclick='clearAddAssignmentProjectDoc()'>关闭</button></div>");
        modelContent.append(modelHeader,modelBody,modelFooter);
        add.append(model);
    }

    function clearAddAssignmentProjectDoc() {
        $("#addAssignmentProjectDocTitle").text("");
        $("#addAssignmentProjectDocDocumentType").text("");
    }

    function useAddAssignmentProjectDoc(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        $("#addAssignmentProjectDoc").modal();
        $("#submitAssignmentProjectDoc").attr("name",id);
    }

    function sendAddAssignmentProjectDoc(element) {
        var id = $(element).attr("name");
        var assignmentProjectDocTitle = $("#addAssignmentProjectDocTitle").val();
        var assignmentProjectDocDocumentType = $("#addAssignmentProjectDocDocumentType").val();
        var assignmentProjectDoc={
            documentType:assignmentProjectDocDocumentType,
            assignmentProjectID:id,
            assignmentProjectDocName:assignmentProjectDocTitle
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/addAssignmentProjectDoc.action",
            type:"post",
            data:JSON.stringify(assignmentProjectDoc),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
                if(data==true){
                    alert("添加成功！");
                    clearAddAssignmentProjectDoc();
                    getAssignmentProjectDocList(id);
                }
            },
            error:function () {
                alert("添加错误！")
            }
        })
    }
    function getAssignmentProjectDocListByClick(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));

        getAssignmentProjectDocList(id);
    }


    function getAssignmentProjectDocList(id) {
        $.get(
            "${pageContext.request.contextPath}/getAssignmentProjectListDoc.action?assignmentProjectID="+id,
            function (data) {
                showAssignmentProjectDocList(id,data);
            });
    }

    function showAssignmentProjectDocList(id,data) {
        var name = "assignmentProjectDoc-list-"+id;
        var list = $('#'+name);
        list.text("");
        var assignmentProjectDocList = data;
        var i=0;
        for (i in assignmentProjectDocList){
            var item = assignmentProjectDocList[i];
            var doc = $("<div class='panel panel-info'><div class='panel-heading'><span>"+item.assignmentProjectDocName+"</span><button class='btn btn-danger cd-button' parent=\""+name+"\" id=\"delete-doc-button-"+item.assignmentProjectDocID+"\" onclick=\"sendDeleteAssignmentProjectDoc(this)\">-</button></div></div>")
            list.append(doc);
        }

    }

    function sendDeleteAssignmentProject(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        $.get(
            "${pageContext.request.contextPath}/delAssignmentProject.action?assignmentProjectID="+id,
            function (data) {
                if(data==true){
                    $("#list").text("");
                    getAssignmentProjectList();
                }
            })
    }
    
    function sendDeleteAssignmentProjectDoc(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var parentID = $(element).attr("parent");
        var parentId = parentID.slice(parentID.search(/\d+/));
        $.get(
            "${pageContext.request.contextPath}/delAssignmentProjectDoc.action?assignmentProjectDocID="+id,
            function (data) {
                if(data==true){
                    console.log("OK!");
                    getAssignmentProjectDocList(parentId);
                }
            })
    }

    function showUpdateAssignmentProject(element) {
        clearUpdate();
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var update = $("#update");
        var model = $(" <div class=\"modal fade\" id=\"updateassignmentProject\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
        var modelDialog = $(" <div class=\"modal-dialog\"></div>");
        model.append(modelDialog);
        var modelContent = $("<div class=\"modal-content\"></div>");
        modelDialog.append(modelContent);
        var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">更改作业项</h2></div>");
        var modelBody = $(" <form>" +
            "<div class=\"form-group\"><label for=\"updateAssignmentProjectContent\">作业说明</label><textarea class=\"form-control\" rows=\"8\" id=\"updateAssignmentProjectContent\"></textarea></div>" +
        "<div class=\"form-group\"><label for=\"updateAssignmentProjectDeadLine\">作业截止日期</label><input type=\"date\" class=\"form-control\" id=\"updateAssignmentProjectDeadLine\"></div>" +
        "<div class=\"form-group\"><label for=\"updateAssignmentProjectProportion\">作业分值占比(%)</label><input type=\"number\" min='0' max='100' step='5' class=\"form-control\" id=\"updateAssignmentProjectProportion\"></div>" +
        "</form>");
        var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick=\"sendUpdateAssignmentProject(this)\" id=\"update-button-"+id+"\">保存</button>" +
            "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
        modelContent.append(modelHeader,modelBody,modelFooter);
        update.append(model);
    }

    function clearUpdate() {
        $("#update").text("");
    }

    function sendUpdateAssignmentProject(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var content = $("#updateAssignmentProjectContent").val();
        var deadLine = $("#updateAssignmentProjectDeadLine").val();
        var proportion = $("#updateAssignmentProjectProportion").val();
        var assignmentProject = {
            assignmentProjectID:id,
            assignmentProjectInfo:content,
            assignmentProjectProportion:proportion,
            assignmentProjectDeadLine:deadLine
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/modAssignmentProject.action",
            type:"post",
            data:JSON.stringify(assignmentProject),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
                alert("更改成功!");
                if(data==true){
                    $("#list").text("");
                    getAssignmentProjectList();
                    $("#update").text("");
                }
            }
        })
    }

    function saveAssignmentProjectID(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        sessionStorage.setItem("assignmentProjectID",id);
    }
    
    <%--
function showAddCourseResource() {
    var add = $("#add");
    var model = $(" <div class=\"modal fade\" id=\"addCourseResource\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
    var modelDialog = $(" <div class=\"modal-dialog\"></div>");
    model.append(modelDialog);
    var modelContent = $("<div class=\"modal-content\"></div>");
    modelDialog.append(modelContent);
    var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">添加课程资源</h2></div>");
    var modelBody = $("<form role='form' id=\"addCourseResourceForm\" enctype=\"multipart/form-data\"><div class=\"form-group file\"><label for=\"addCourseResourceInput\"> 请选择文件：</label><input class='form-control fileUp-button' id=\"addCourseResourceInput\" type=\"file\" name=\"file\"/>" +
        "</div></form>");
    var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick='sendAddCourseResource()'>提交</button>" +
        "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
    modelContent.append(modelHeader,modelBody,modelFooter);
    add.append(model);
}

function clearAddCourseNotice() {
    $("#addCourseResourceInput").value="";
}

function sendAddCourseResource() {
    var formData = new FormData($("#addCourseResourceForm")[0]);
    var fileName = $("#addCourseResourceInput").val().substring($("#addCourseResourceInput").val().lastIndexOf("\\")+1);
    formData.append("fileName",fileName);
    console.log("发送添加请求！");
    console.log($("#addCourseResourceInput").val());
    $.ajax({
        url:"${pageContext.request.contextPath}/addCourseResource.action",
        type:"post",
        data:formData,
        contentType: false,
        processData: false,
        success:function (data) {
            if(data==true){
                alert("上传成功！");
                clearAddCourseNotice();
                getCourseResourceList();
            }
        },
        error:function () {
            alert("上传错误！请注意是否上传了同名文件")
        }
    })
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
            "<a href=\"${pageContext.request.contextPath}/downloadCourseResource.action?courseResourceID="+item.courseResourceID+"\"><button class='btn btn-success cd-button' id=\"download-courseResource-button-"+item.courseResourceID+"\" >↓</button></a>" +
            "<button class='btn btn-danger cd-button'id=\"delete-courseResource-button-"+item.courseResourceID+"\" onclick='sendDeleteCourseResource(this)'>-</button></div> ");
        courseResourcePanel.append(courseResourceBody);
        list.append(courseResourcePanel);
    }
}

function sendDeleteCourseResource(element) {
    var elementID = $(element).attr("id");
    var id = elementID.slice(elementID.search(/\d+/));
    $.ajax({
        url:"${pageContext.request.contextPath}/delCourseResource.action",
        type:"get",
        data:"courseResourceID="+id,
        contentType:"application/json;charset=UTF-8",
        dataType:"json",
        success:function (data) {
            if(data==true){
                getCourseResourceList();
            }
        }

    })
}




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
