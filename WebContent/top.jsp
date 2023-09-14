<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="js/jquery.js"></script>
		<script type="text/javascript">
			$(function() {
				
				//顶部导航切换
				$(".nav li a").click(function() {
					$(".nav li a.selected").removeClass("selected")
					$(this).addClass("selected");
				})
			})
		</script>

	</head>

	<body style="background:url(images/topbg.gif) repeat-x;">
		<div class="topleft">
			<a href="${pageContext.request.contextPath }/user_indexUI.action" target="_parent"><img src="images/lg.png" /><img src="images/shcool.png" title="系统首页" /></a>
		</div>


		<div class="topright">
			<ul>
				<li><span class="redcolor">版本</span>
					<a href="#">v1.0.0</a>
				</li>
				<li>
					<a href="aboutus.html" target="rightFrame">关于</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/user_logout.action" target="_parent">退出</a>
				</li>
			</ul>
			
			<div class="user">
				<span>${existUser.username }</span>
				<c:if test="${existUser.identity==0 }">
					<i>学生</i>
				</c:if>
				<c:if test="${existUser.identity==1 }">
					<i>楼宇管理员</i>
				</c:if>
				<c:if test="${existUser.identity==2 }">
					<i>系统管理员</i>
				</c:if>
			</div>

		</div>
		
	</body>

</html>