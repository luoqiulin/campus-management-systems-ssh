<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
<script type="text/javascript">
		/* 页面加载  */
	
</script>
</head>
<body>

<!-- 添加缺勤记录 -->
	<form action="${ctx }/absenteeRecord_addrec.action" method="post" target="rightFrame" >
		<div id="addUser">
				<ul>
					<li>
						学生姓名<input class="loginuser" disabled="disabled" value="${recordUser.username }" />
					</li>
					<li>
						学生学号<input class="loginuser" disabled="disabled" value="${recordUser.usercode }" />
						<!-- 学生的楼宇  -->
						<input  type="hidden" name="buildingId" value="${recordUser.building_id }" />
						
						<!-- 学生id -->
						<input  type="hidden" name="user.user_id" value="${recordUser.user_id }" />
						<!-- 管理员id -->
						<input  type="hidden" name="t_u_user" value="${existUser.user_id }" />
					</li>
					
					<li>
						学生电话<input class="loginuser" disabled="disabled"  value="${recordUser.phone }" />
					</li>
					<li>
						所住宿舍<input class="loginuser" disabled="disabled"  value="${recordUser.dormitory.dormitory_name }" />
						<input type="hidden" name="dorId"   value="${recordUser.dormitory.dormitory_id }" />
					</li>
					<li>
						缺勤次数<input class="loginuser" disabled="disabled"  value="${fn:length(recordUser.absenteeRecords)}" />
					</li>
					
					<li>
						本次详情<textarea  style="overflow:scroll; overflow-x:hidden;overflow-y:hidden; border:1px dashed black; width: 500px; height: 100px; margin-left: 30px;" name="absentee_desc" placeholder="请填写本次缺勤原因详情"></textarea>
					</li>
					
					<li>
					<input id="isp" class="loginerr" readonly="readonly" ></input>	<input style="margin-left: 150px;" type="submit" id="submit"  class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	
</body>
</html>