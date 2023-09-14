<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>欢迎登录宿舍管理系统</title>
		<link rel="icon" href="${pageContext.request.contextPath }/images/title3.ico" type="image/x-icon" />
		<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="${ctx }/js/jquery.js"></script>
		<!--云朵和白夜背景js-->
		<script src="${ctx }/js/cloud.js" type="text/javascript"></script>
		<script src="${ctx }/js/code.js" type="text/javascript"></script>
		<script language="javascript">
		
			$(function() {
				$('.loginbox').css({
					'position': 'absolute',
					'left': ($(window).width() - 692) / 2
				});
				$(window).resize(function() {
					$('.loginbox').css({
						'position': 'absolute',
						'left': ($(window).width() - 692) / 2
					});
				})
			
			});
			
			$(function(){
				$("#user").focus(function(){
					$("#loginerr").val("");
				});
				$("#pwd").focus(function(){
					$("#loginerr").val("");
				});
				$("#code").focus(function(){
					$("#loginerr").val("");
				});
			});
			
			
			var state = true;
			function changePwd(){
				if(state){
					document.getElementById("pwd").type = "text";
					document.getElementById("see").src = "${ctx}/img/cantsee.png";
					state = false;
				}else{
					document.getElementById("pwd").type = "password";
					document.getElementById("see").src = "${ctx}/img/see.png";
					state = true;
				}
				
			}
			
			function checkUPC(){
				var src = document.getElementById("codeImg").src;
				var code = src.substring(src.length-8).substring(0,4);
				if($("#user").val()==""){
					$("#loginerr").val("账号为空！");
					return false;
				}
				if($("#pwd").val()==""){
					$("#loginerr").val("密码为空！");
					return false;
				}
				if($("#code").val()==""){
					$("#loginerr").val("验证码为空！");
					return false;
				}
				if($("#code").val().toLowerCase()!=code.toLowerCase()){
					$("#loginerr").val("验证码有误！");
					changeCode();
					return false;
				}
				
				return true;
			}
			
		</script>

	</head>

	<body style="background-color:#1c77ac; background-image:url(${ctx}/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
		
		<div id="mainBody">
			<!--两朵漂浮的云-->
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>

		<div class="logintop">
			<span>欢迎进入校园宿舍管理系统登录界面</span>
			<span id="topspan">请使用IE10及以上浏览器使用本软件</span>
			<ul>
				<li>
					<a href="#">帮助</a>
				</li>
				<li>
					<a href="#">关于</a>
				</li>
			</ul>
		</div>

		<div class="loginbody">

			<span class="systemlogo"></span>

			<div class="loginbox">
				<img class="plan" src="img/plan.png"/>
				
				<form action="${pageContext.request.contextPath }/user_login.action" method="post" onsubmit="return checkUPC()" target="_parent">
					<ul>
						<li>
							<select class="loginsel" name="identity">
								<option value="2">系统管理员</option>
								<option value="1">楼宇管理员</option>
								<option value="0">学生</option>
							</select>
							
						</li>
						<li><input name="usercode" id="user" type="text" value="${failUser.usercode }" class="loginuser" placeholder="admin"  /></li>
						
							
						<!--密码框禁止复制粘贴onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false"-->
						<li><input name="password" id="pwd" type="password" class="loginpwd" placeholder="password"  onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" /></li><a onclick="changePwd()" ><img class="seepwd" id="see"  src="img/see.png" align="right"/></a>
						<li><input name="code" id="code" type="text" class="logincode"  maxlength="4" /><div><img id="codeImg" height="48" onclick="changeCode()"  style="margin-left: 10px;"/><a onclick="changeCode()">看不清?点我</a></div></li>
						<li>
							<!--提示错误的输入框  不可编辑  没有border-->
							<input type="text" id="loginerr" class="loginerr" readonly="readonly" value="${fail }"/>
							<input  type="submit"  class="loginbtn" value="登录" />
							<!--重置-->
							<input type="reset" class="loginbtn" value="清除" style="margin-left: 30px;"/></li>
					</ul>
				</form>

			</div>

		</div>

		<div class="loginbm">版权所有 besteam.org 仅供学习交流，勿用于任何商业用途</div>
	</body>

</html>