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
<!-- 添加学生 -->
		<div id="addUser">
				<ul>
					<li>
						楼宇栋号<input class="loginuser" readonly="readonly" value="${updateBuilding.building_id }" />
					</li>
					<li>
						楼宇介绍<input class="loginuser" readonly="readonly" value="${updateBuilding.b_desc }" />
					</li>
					<li>
						入住性别<input class="loginuser" readonly="readonly" value="${updateBuilding.gender_in }生" />
					</li>
					
					<c:if test="${updateBuilding.user_id!=0}">
					<li>
						<!-- 管理员不为空 -->
							管理员ID<input class="loginuser" readonly="readonly" value="${updateBuilding.user_id }" />
					</li>
					</c:if>
					<c:if test="${updateBuilding.user_id==0}">
					<li>
						<!-- 管理员为空 -->
						管理员ID<input class="loginuser" readonly="readonly" value="无人管理" />
					</li>
					</c:if>
					<li>	
						宿舍个数<input class="loginuser" readonly="readonly" value="${fn:length(updateBuilding.dormitorys)}" />
					</li>
					
				</ul>
				
			</div>
	

</body>
</html>