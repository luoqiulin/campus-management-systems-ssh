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
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	
    <dl class="leftmenu" >
    	<dd  >
    		<div class="title">
    			<span><img src="images/leftico01.png" /></span>菜单导航
    		</div>
    		<ul class="menuson">
    			
		        <li class="active"><cite></cite><a href="welcome.html" target="rightFrame">首页</a><i></i></li>
		        <c:if test="${existUser.identity==2 }"  >
			        <li><cite></cite><a href="${ctx }/user_findByPageUI.action?identity=1" target="rightFrame">楼宇管理员管理</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_findByPageUI.action?identity=0" target="rightFrame">学生管理</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/building_findByPageUI.action" target="rightFrame">楼宇管理</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/dormitory_findByPageUI.action" target="rightFrame">宿舍管理</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_studnetinUI.action" target="rightFrame">学生入住登记</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_changeDroUI.action" target="rightFrame">学生寝室调换</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_outSchoolUI.action" target="rightFrame">学生迁出登记</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/absenteeRecord_findAbsUI.action" target="rightFrame">学生缺寝记录</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_changePwdUI.action" target="rightFrame">修改密码</a><i></i></li>
			        <li><cite></cite><a href="${pageContext.request.contextPath }/user_logout.action" target="_parent">退出登录</a><i></i></li>
		        </c:if>
		        
		         <c:if test="${existUser.identity==1 }"  >
			        <li><cite></cite><a href="${ctx }/user_findByPageUI.action?identity=0&pageCode=1" target="rightFrame">学生管理</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_studnetinUI.action" target="rightFrame">学生入住登记</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_changeDroUI.action" target="rightFrame">学生寝室调换</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_outSchoolUI.action" target="rightFrame">学生迁出登记</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/absenteeRecord_recordUI.action" target="rightFrame">学生缺寝登记</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/absenteeRecord_findAbsUI.action" target="rightFrame">学生缺寝记录</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_changePwdUI.action" target="rightFrame">修改密码</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_logout.action" target="_parent">退出登录</a><i></i></li>
		        </c:if>
		         <c:if test="${existUser.identity==0 }"  >
			        <li><cite></cite><a href="${ctx }/user_changePwdUI.action" target="rightFrame">修改密码</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/absenteeRecord_showMe.action" target="rightFrame">我的缺勤记录</a><i></i></li>
			        <li><cite></cite><a href="${ctx }/user_logout.action" target="_parent">退出登录</a><i></i></li>
		        </c:if>
        	</ul>    
   	 	</dd>
    </dl>
</body>
</html>