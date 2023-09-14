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
	$(function(){
		$("#uc").blur(function(){
		//获取当前文本框的值
		var $val = $(this).val();
		//get方法  url date fun
		$.get("${ctx}/user_outSchoolCheck.action?", "usercode=" + $val, function(d) {
				if (d == 0) {
					//隐藏的文本域
					$("#userSpan").html("<font color = 'green'>可以选择迁出!</font>");
					//提交按钮不可用
					$("#submit").attr('disabled',false);
				} else if (d == 1) {
					
					$("#userSpan").html("<font color='red'>学号输入错误!</font>");
					//设置提交按钮属性为可以提交
					$("#submit").attr('disabled',true);
					
				} else if (d == 2) {
					$("#userSpan").html("<font color = 'red'>学号不能为空!</font>");
					$("#submit").attr('disabled',true);
				
				}else if(d == 3){
					$("#userSpan").html("<font color = 'red'>该学生未入住!</font>");
					$("#submit").attr('disabled',true);
				}
			});
		
		});
});
</script>
</head>
<body>
<!-- 添加宿舍  -->
	<form action="${ctx }/user_outSchool.action" method="post" onsubmit="return checkForm()" target="rightFrame" >
		<div id="addUser">
				<ul>
					<li>
						<a style="color: red;">学生迁出后将无法撤销,且将无法登陆！请谨慎操作</a>
					</li>
					
					<li>
						请输入学生学号<input class="loginuser" id="uc" name="usercode"/><a id="userSpan" >${outSucc }</a>
					</li>
					<li>
					<input style="margin-left: 150px;" type="submit" id="submit" disabled="disabled" onclick="confirm('确定迁出?')" class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	

</body>
</html>