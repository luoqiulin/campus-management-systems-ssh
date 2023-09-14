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
		
</script>
</head>
<body>
<!-- 添加学生 -->
	<form action="${ctx }/building_updateBInfo.action"  method="post">
		<div id="addUser">
				<ul>
					<li>
						楼宇栋号<input class="loginuser" name="building_id" readonly="readonly" value="${bInfo.building_id }" />
					</li>
					<c:if test="${bInfo.user_id!=0}">
					<li>
						<!-- 管理员不为空 -->
							管理员ID<input class="loginuser" name="oldId" readonly="readonly" value="${bInfo.user_id }" />
					</li>
					</c:if>
					<c:if test="${bInfo.user_id==0}">
					<li>
						<!-- 管理员为空 -->
						管理员ID<input class="loginuser" readonly="readonly" value="无人管理" />
					</li>
					</c:if>
					<li>
						楼宇介绍<input class="loginuser" readonly="readonly" value="${bInfo.b_desc }" />
					</li>
					<li>
						入住性别<input class="loginuser" readonly="readonly" value="${bInfo.gender_in }生" />
					</li>
					
					<li>	
						宿舍个数<input class="loginuser" readonly="readonly" value="${fn:length(bInfo.dormitorys)}" />
					</li>
					<!-- 新管理员  -->
					<li>
						<select name="user_id" class="loginsel" style="margin-left: 300px;" >
							<c:forEach items="${uPage.beanList }" var="u">
								<option value="${u.user_id }">${u.username }</option>
							</c:forEach>
						
						</select>
					</li>
					<li>
						<input type="submit" class="loginbtn" value="提交">
					</li>
				</ul>
				
			</div>
	</form>

</body>
</html>