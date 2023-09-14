<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<!-- 添加宿舍  -->
	<form action="${ctx }/user_studentin.action" method="post" onsubmit="return checkForm()" target="rightFrame" >
		<div id="addUser">
				<ul>
					<li>
						请输入学号<input class="loginuser" name="usercode"/><a>${check_in }</a>
					</li>
					<li>
					<input style="margin-left: 150px;" type="submit" id="submit"  value="下一步" class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	

</body>
</html>