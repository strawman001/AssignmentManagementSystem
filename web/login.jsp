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
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
    <script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
    <!--引入BootStrap的JS的文件-->
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
</head>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>

        <div class="col-md-4 column">
            <form role="form" action="${pageContext.request.contextPath}/login.action" onsubmit="return checkValue()" method="post">
                <div class="form-group">
                    <label for="userName">用户名</label><input type="text" class="form-control" id="userName" name="userName" />
                </div>
                <div class="form-group">
                    <label for="password">密码</label><input type="password" class="form-control" id="password" name="password" />
                </div>
                <button type="submit" class="btn btn-default" id="loginBtn">登录</button>
            </form>
        </div>
        <div class="col-md-4 column">
        </div>

    </div>
</div>
<script>
    function checkValue() {
        var userName = $.trim($("#userName").val());
        var password = $.trim($("#password").val());
        if (userName.length < 1) {
            alert("请输入账号");
            $("#userNameView").focus();
            return false;
        }
        if (password.length < 1) {
            alert("请输入密码");
            $("#passwordView").focus();
            return false;
        }
        return true;
    }
</script>
</html>