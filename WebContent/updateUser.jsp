<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript">
/* 栈中对象 updateUser */
		/* 页面加载  */
	$(function(){
		
	});
		
	function checkForm() {
		if($("#un").val()==""){
			$("#isp").val("姓名不能为空！");
			return false;
		}
		if($("#up").val()==""){
			$("#isp").val("密码不能为空！");
			return false;
		}
		if($("#uph").val()==""){
			$("#isp").val("电话不能为空！");
			return false;
		}
		$("#isp").val("");
		return true;
	}
</script>
</head>
<body>
<!-- 修改学生 -->
	<c:if test="${updateUser.identity==0 }">
		<div id="addUser">
				<ul>
					<li>
						学生姓名<input class="loginuser" readonly="readonly" value="${updateUser.username }" />
					</li>
					<li>
						学生账号<input class="loginuser" readonly="readonly" value="${updateUser.usercode }" />
					</li>
					
					<li>
						<c:if test="${ not empty updateUser.dormitory.dormitory_name}">
							所住楼宇<input class="loginuser" readonly="readonly" value="${updateUser.building_id }栋" />
						</c:if>
					</li>
					<li>
						<!-- 若未入住 -->
						<c:if test="${ empty updateUser.dormitory.dormitory_name}">
						所住宿舍<input class="loginuser" readonly="readonly" value="未入住" />
						</c:if>
					</li>
					<li>	
						<c:if test="${not empty updateUser.dormitory.dormitory_name}">
						所住宿舍<input class="loginuser" readonly="readonly" value="${updateUser.dormitory.dormitory_name }" />
						</c:if>
					</li>
					<li>
						学生性别<input class="loginuser" readonly="readonly" value="${updateUser.gender }" />
					</li>
					<li>
						学生电话<input class="loginuser" readonly="readonly" value="${updateUser.phone }" />
					</li>
					<li>
						缺勤次数<input class="loginuser" readonly="readonly" value="${fn:length(updateUser.absenteeRecords)}" />
					</li>
					
				</ul>
				
			</div>
	</c:if>
	
<!-- 修改管理员 -->
	<c:if test="${updateUser.identity==1 }">
	<form action="${ctx }/user_addUser.action" method="post" onsubmit="return checkForm()" target="_parent" >
		<div id="addUser">
				<ul>
					<li>
						管理员姓名<input class="loginuser" readonly="readonly" value="${updateUser.username }" />
					</li>
					<li>
						管理员账号<input class="loginuser" readonly="readonly" value="${updateUser.usercode }" />
					</li>
					
					<li>
						<c:if test="${not empty updateUser.building_id}">
							管理的楼宇<input class="loginuser" readonly="readonly" value="${updateUser.building_id }栋" />
						</c:if>
						<c:if test="${empty updateUser.building_id}">
							管理的楼宇<input class="loginuser" readonly="readonly" value="暂未安排" />
						</c:if>
					</li>
					
					<li>
						管理员性别<input class="loginuser" readonly="readonly" value="${updateUser.gender }" />
					</li>
					<li>
						管理员电话<input class="loginuser" readonly="readonly" value="${updateUser.phone }" />
					</li>
				</ul>
				
			</div>
	</form>
	</c:if>
</body>
</html>