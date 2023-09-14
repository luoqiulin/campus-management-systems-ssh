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
<!-- 宿舍信息  -->
		<div id="addUser">
				<ul>
					<li>
						宿舍名称<input class="loginuser" readonly="readonly" value="${dor.dormitory_name }" />
					</li>
					<li>
						入住人数<input class="loginuser" readonly="readonly" value="${dor.dor_number }" />
					</li>
					<li>
						宿舍类型<input class="loginuser" readonly="readonly" value="${dor.gender_in }生宿舍" />
					</li>
					<li>	
						宿舍电话<input class="loginuser" readonly="readonly" value="${dor.dor_phone}" />
					</li>
						<li>入住成员：	
					<c:forEach items="${dor.users }" var="u">
							${u.username}&nbsp;&nbsp;
					</c:forEach>
						</li>
				</ul>
				
			</div>
	

</body>
</html>