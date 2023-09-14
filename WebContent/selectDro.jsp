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
<!-- 选择宿舍入住  -->
	<form action="${ctx }/user_selectDro2.action" method="post" onsubmit="return checkForm()" target="rightFrame" >
		<div id="addUser">
				<input type="hidden" name="user_id" value="${user_id }"/><!-- 学生id -->
				<ul><!-- inbud -->
					<li>
						选择楼宇<select name="building_id" id="v">
							<c:forEach items="${inbud }" var="b">
								<option value="${b.building_id }">${b.b_desc }</option>	
							</c:forEach>
							 </select>
					</li>
					<li>
					<input style="margin-left: 150px;" type="submit" id="submit"  value="下一步" class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	

</body>
</html>