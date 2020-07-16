
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        #student-list-div {position:fixed;top:0;left:0;width:220px;height:100%;border: 3px solid black;border-radius:10px;z-index:9999;}
        #student-list li{list-style-type: none;cursor: pointer}
        #student-list {margin: 0px;padding:0px}
        .show-nav {transform:translateX(0);}
        .hide-nav {transform:translateX(-220px);} /*侧滑关键*/
        .student-list-nav-taggle {position: fixed;right:3px;top:50%;bottom:50%;display:block;cursor:pointer;}
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
    </style>
</head>
<body>
<div id="student-list-div" class="mobile-nav">
   <ul id="student-list" class="list-group">
   </ul>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <div class="panel panel-default"><div class="panel-heading" id="title">文件目录</div></div>
            <div id="doc-list" class="panel-group"></div>
            <div id="evaluate-area">
                <form>
                <div class="panel-group">
                    <div class="panel panel-primary">
                        <label for="assignmentEntity-score" class="form-control">评分</label>
                        <input class="form-control" type="text" id="assignmentEntity-score">
                        <label for="assignmentEntity-eval" class="form-control">评语</label>
                        <textarea rows="8" class="form-control" id="assignmentEntity-eval"></textarea>
                        <button type="button" class="form-control btn btn-primary" onclick="evalAssignmentEntity()">提交</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-2">
            <div class="student-list-nav-taggle">
                <a href="#"  id="nav-taggle">
                    <span id="student-list-btn"><<</span>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $("#nav-taggle").click(function () {
        var studentDiv = $("#student-list-div");
        if (studentDiv.hasClass("show-nav")) {
            setTimeout(function () {
                $("#student-list-btn").text(">>");
                studentDiv.addClass("hide-nav").removeClass("show-nav");
            }, 100)
        }
        else {
            setTimeout(function (){
                $("#student-list-btn").text("<<");
                studentDiv.addClass("show-nav").removeClass("hide-nav");
            }, 100)
        }
    })

    var assignmentProjectID;
    var assignmentEntityID;
    window.onload=function (ev) {
        assignmentProjectID = sessionStorage.getItem("assignmentProjectID");
        getStudentList();
    }

    function getStudentList() {
        $.get(
            "${pageContext.request.contextPath}/getCourseStudent.action",
            function (data) {
                showStudentList(data);
            }
        )
    }

    function showStudentList(data) {
        var studentList = data;
        var length = studentList.length;
        var studentListUL=$("#student-list");
        var i=0;
        for (i in studentList){
            var item = studentList[i];
            var studentItem=$("<a id=\"student-"+item.studentCode+"\" onclick=\"getAssignmentEntity(this)\" name=\""+item.studentName+"\"><li class=\"list-group-item\">"+item.studentCode+" "+item.studentName+"</li></a>");
            studentListUL.append(studentItem);
        }
        getAssignmentEntityInit(studentList[0]);
    }

    function getAssignmentEntityInit(item) {
        var id = item.studentCode;
        var name = item.studentName;
        var title = $("#title");
        $.get(
            "${pageContext.request.contextPath}/getAssignmentEntityByStudent.action?studentCode="+id+"&assignmentProjectID="+assignmentProjectID,
            function (data) {
                var assignmentEntity = data;
                assignmentEntityID = assignmentEntity.assignmentEntityID;
                getAssignmentEntityDocList(assignmentEntity.assignmentEntityID);
                title.text("文档目录："+id+" "+name);
            }
        )
    }

    function getAssignmentEntity(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var name = $(element).attr("name");
        var title = $("#title");
        $.get(
            "${pageContext.request.contextPath}/getAssignmentEntityByStudent.action?studentCode="+id+"&assignmentProjectID="+assignmentProjectID,
            function (data) {
                var assignmentEntity = data;
                assignmentEntityID = assignmentEntity.assignmentEntityID;
                getAssignmentEntityDocList(assignmentEntity.assignmentEntityID);
                title.text("文档目录："+id+" "+name);
            }
        )
    }

    function getAssignmentEntityDocList(id){

        $.get(
            "${pageContext.request.contextPath}/getAssignmentEntityDocList.action?assignmentEntityID="+id,
            function (data) {
                showAssignmentEntityDocList(data);
            }
        )
    }

    function showAssignmentEntityDocList(data) {
        var assignmentEntityDocList = data;
        var docList = $("#doc-list");
        docList.text("");
        var i=0;
        for (i in assignmentEntityDocList){
            var item = assignmentEntityDocList[i];
            var name = item.assignmentEntityDocSaveLocation.slice(item.assignmentEntityDocSaveLocation.lastIndexOf("\\")+1);
            var state = item.assignmentEntityDocState;
            switch (state) {
                case 0:
                    var assignmentEntityDocDiv=$("<div class='panel panel-danger' id=\"assignmentEntityDocDiv-"+item.assignmentEntityDocID+"\"></div>");
                    var assignmentEntityDocName=$("<div class='panel-heading'>"+name+":未提交"+"</div>");
                    assignmentEntityDocDiv.append(assignmentEntityDocName);
                    docList.append(assignmentEntityDocDiv);
                    break;
                case 1:
                    var assignmentEntityDocDiv=$("<div class='panel panel-primary' id=\"assignmentEntityDocDiv-"+item.assignmentEntityDocID+"\"></div>");
                    var assignmentEntityDocName=$("<div class='panel-heading'>"+name+":已提交"+"</div>");
                    $.get(
                        "${pageContext.request.contextPath}/canView.action?documentTypeName="+item.documentType,
                        function (data) {
                            if (data==true){
                                var assignmentEntityView=$("<a id=\"a-view-"+item.assignmentEntityDocID+"\" onclick=\"showPreView(this)\"><button class=\"btn btn-default cd-button \" id=\"view-button-"+item.assignmentEntityDocID+"\"  data-toggle=\"modal\" >V</button></a>");
                                assignmentEntityDocName.append(assignmentEntityView);
                            }
                        }
                    );
                    var assignmentEntityDownload=$("<a href=\"${pageContext.request.contextPath}/downloadAssignmentEntityDoc.action?assignmentEntityDocID="+item.assignmentEntityDocID+"\"><button class=\"btn btn-success cd-button \" id=\"download-button-"+item.assignmentEntityDocID+"\"  data-toggle=\"modal\" >↓</button></a>");
                    assignmentEntityDocName.append(assignmentEntityDownload);
                    assignmentEntityDocDiv.append(assignmentEntityDocName);
                    docList.append(assignmentEntityDocDiv);
            }
        }
    }

    function showPreView(element) {
        var elementID = $(element).attr("id");
        var id = elementID.slice(elementID.search(/\d+/));
        var iframe=$("<iframe id=\"mainFrame-"+id+"\" style='width: 100%;height: 100%'></iframe>");
        var assignmentDocDiv = $('#assignmentEntityDocDiv-'+id);
        assignmentDocDiv.append(iframe);
        $.get(
            "${pageContext.request.contextPath}/getPreView.action?assignmentEntityDocID="+id,
            function (data) {
                var loc = data;
                iframe.attr("src","${pageContext.request.contextPath}/cachePDF/"+loc);
            }
        )
    }

    function evalAssignmentEntity() {
        var ID = assignmentEntityID;
        var score=$("#assignmentEntity-score").val();
        var comment=$("#assignmentEntity-eval").val();
        var assignmentEntity={
            assignmentEntityID:ID,
            assignmentEntityScore:score,
            assignmentEntityComment:comment
        };
        $.ajax({
            url:"${pageContext.request.contextPath}/evalAssignmentEntity.action?assignmentEntityID="+assignmentEntityID,
            type:"post",
            data:JSON.stringify(assignmentEntity),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
                if(data==true){
                    clearEval();
                    alert("评价成功！");
                }
            },
            error:function () {
                alert("评价失败！")
            }
        });
    }

    function clearEval() {
       $("#assignmentEntity-score").val("");
       $("#assignmentEntity-eval").val("");
    }
</script>
</html>
