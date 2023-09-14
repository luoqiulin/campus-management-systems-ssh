<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	li{
		margin-top: 30px;
		
	}
	input{
		margin-left: 30px;
	}
</style>
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
	function checkPwd(){
		var exitPwd = document.getElementById("existUser").value;
		var oldPwd = document.getElementById("oldPwd").value;
		var newPwd = document.getElementById("newPwd").value;
		var againPwd = document.getElementById("againPwd").value;
		if(exitPwd==oldPwd){
			//旧密码和新密码相同
			return true;
		}else{
			alert("原始密码错误！");
			return false;
			
		}
		if(newPwd==againPwd){
			//两次密码一致
			return true;
		}else{
			alert("两次密码输入不一致！");
			return false;
			
		}
		return true;
	}
</script>
<title>修改密码</title>
</head>
<body>
		<form action="${pageContext.request.contextPath }/user_changePwd.action" method="post" onsubmit="return checkPwd()" target="_parent">
		<div id="changePwd" style="height: 500px;width: 500px;margin: 0 auto; margin-top: 50px;">
			<ul>
				<!-- 原始密码 -->
				<li><input id="existUser" type="hidden" value="${existUser.password }" ></li>
				<li>请输入原始密码<input id="oldPwd" type="password" class="loginpwd" ></li>
				<li>请输入新的密码<input id="newPwd" type="password" class="loginpwd"></li>
				<li>请再次输入密码<input id="againPwd" name="password" type="password" class="loginpwd"></li>
				<li style="margin-left: 200px;"><input type="submit" class="loginbtn" onclick="confirm('确定修改?')"></li>
			</ul>
		</div>
		</form>
</body>
</html>