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
            width: 33%;
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
            </ul>
            <div>
                <div id="list"></div>
                <div id="submit"></div>
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
    }

    function getAssignmentProjectList() {
        $("#list").text("");
        $.get(
            "${pageContext.request.contextPath}/getAssignmentProjectListStudent.action",
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
            assignmentProjectHeadingDiv.append(assignmentProjectHeading);
            var assignmentProjectContent = $("<div id=\"assignmentProject-content-"+item.assignmentProjectID+"\" class=\"panel-collapse collapse\"></div>");
            var assignmentProjectInfo=$("<div class=\"panel-body\" id=\"#assignmentProject-info-"+item.assignmentProjectID+"\"><p>"+item.assignmentProjectInfo+"</p></div>");
            var assignmentProjectDocList=$("<div class=\"panel-group\" id=\"assignmentProjectDoc-list-"+item.assignmentProjectID+"\"></div>");
            assignmentProjectContent.append(assignmentProjectInfo);
            assignmentProjectContent.append(assignmentProjectDocList);
            assignmentProjectSecond.append(assignmentProjectHeadingDiv);
            assignmentProjectSecond.append(assignmentProjectContent);
            list.append(assignmentProjectFirst);
        }
    }


    function getAssignmentProjectDocListByClick(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));

        getAssignmentProjectDocList(id);
    }


    function getAssignmentProjectDocList(id) {
        $.get(
            "${pageContext.request.contextPath}/getAssignmentProjectListDocStudent.action?assignmentProjectID="+id,
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
            showAssignmentEntityDoc(item,list,id);
        }
    }

    function showAssignmentEntityDoc(item,list,id) {
        $.get(
            "${pageContext.request.contextPath}/getAssignmentEntityDocStudent.action?assignmentProjectID="+id+"&assignmentProjectDocID="+item.assignmentProjectDocID,
            function (assignmentEntityDoc) {
                var doc;
                if (assignmentEntityDoc.assignmentEntityDocState==0)
                    doc = $("<div class='panel panel-danger'><div class='panel-heading'><span>"+item.assignmentProjectDocName+":未完成"+"</span><button class='btn btn-primary cd-button' id=\"submit-doc-button-"+assignmentEntityDoc.assignmentEntityDocID+"\" name=\"assignmentProjectID"+id+"\" href='#submitAssignmentEntityDoc' data-toggle=\"modal\" onclick=\"showSubmitAssignmentEntityDoc(this)\">↑</button></div></div>");
                else if (assignmentEntityDoc.assignmentEntityDocState==1)
                    doc = $("<div class='panel panel-success'><div class='panel-heading'><span>"+item.assignmentProjectDocName+":按时完成"+"</span><button class='btn btn-primary cd-button' id=\"submit-doc-button-"+assignmentEntityDoc.assignmentEntityDocID+"\" name=\"assignmentProjectID"+id+"\" href='#submitAssignmentEntityDoc' data-toggle=\"modal\" onclick=\"showSubmitAssignmentEntityDoc(this)\">↑</button></div></div>");
                else if (assignmentEntityDoc.assignmentEntityDocState==2)
                    doc = $("<div class='panel panel-warning'><div class='panel-heading'><span>"+item.assignmentProjectDocName+":未按时完成"+"</span><button class='btn btn-primary cd-button' id=\"submit-doc-button-"+assignmentEntityDoc.assignmentEntityDocID+"\" name=\"assignmentProjectID"+id+"\" href='#submitAssignmentEntityDoc' data-toggle=\"modal\" onclick=\"showSubmitAssignmentEntityDoc(this)\">↑</button></div></div>");
                list.append(doc);
            }
        )
    }


    function showSubmitAssignmentEntityDoc(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var elementName = $(element).attr("name");
        var assigmentProjectID = elementName.slice(elementName.search(/\d+/));

        var submit = $("#submit");
        submit.val("");
        var model = $(" <div class=\"modal fade\" id=\"submitAssignmentEntityDoc\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"></div>");
        var modelDialog = $(" <div class=\"modal-dialog\"></div>");
        model.append(modelDialog);
        var modelContent = $("<div class=\"modal-content\"></div>");
        modelDialog.append(modelContent);
        var modelHeader = $("<div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h2 class=\"modal-title\" id=\"myModalLabel\">上传作业</h2></div>");
        var modelBody = $("<form role='form' id=\"submitAssignmentEntityDocForm\" enctype=\"multipart/form-data\"><div class=\"form-group file\"><label for=\"submitAssignmentEntityDocInput\"> 请选择文件：</label><input class='form-control fileUp-button' id=\"submitAssignmentEntityDocInput\" type=\"file\" name=\"file\"/>" +
            "</div></form>");
        var modelFooter = $("<div class=\"modal-footer\"> <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" id=\"submit-button-"+id+"\" name=\"assigmentProjectID-"+assigmentProjectID+"\" onclick='submitAssignmentEntityDoc(this)'>提交</button>" +
            "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button></div>");
        modelContent.append(modelHeader,modelBody,modelFooter);
        submit.append(model);
    }

    function submitAssignmentEntityDoc(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var elementName = $(element).attr("name");
        var assigmentProjectID = elementName.slice(elementName.search(/\d+/));
        var formData = new FormData($("#submitAssignmentEntityDocForm")[0]);
        formData.append("assignmentEntityDocID",id);
        $.ajax({
            url:"${pageContext.request.contextPath}/submitAssignmentProjectEntityDocStudent.action",
            type:"post",
            data:formData,
            contentType: false,
            processData: false,
            success:function (data) {
                if(data==true){
                    alert("上传成功！");
                    var submit = $("#submit");
                    submit.val("");
                    getAssignmentProjectDocList(assigmentProjectID);
                }
            },
            error:function () {
                alert("上传错误！")
            }
        })
    }

    

</script>
</html>
