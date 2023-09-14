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
		/* 页面加载  */
	$(function(){
		$("#uc").blur(function(){
			//获取当前文本框的值
			var $val = $(this).val();
			//get方法  url date fun
			$.get("${ctx}/user_checkUsercode.action?", "usercode=" + $val, function(d) {
				if (d == 0) {
					//隐藏的文本域
					$("#userSpan").html("<font color = 'red'>账号已存在!</font>");
					//提交按钮不可用
					$("#submit").attr('disabled',true);
				} else if (d == 1) {
					
					$("#userSpan").html("<font color='green'>账号可以使用!</font>");
					//设置提交按钮属性为可以提交
					$("#submit").attr('disabled',false);
					
				} else if (d == 2) {
					$("#userSpan").html("<font color = 'red'>账号不能为空!</font>");
					$("#submit").attr('disabled',true);
				
				}
			});
			
		});
		
	});
		
	function checkForm() {
		if($("#un").val()==""){
			$("#isp").val("姓名不能为空！");
			return false;
		}
		if($("#uc").val()==""){
			$("#isp").val("用户名不能为空！");
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
<!-- 楼宇  -->
	<c:if test="${existUser.identity==2 }">
	<form action="${ctx }/building_addBuilding.action" method="post" onsubmit="return checkForm()" target="rightFrame" >
		<div id="addUser">
				<ul>
					<li>
						楼宇简介<input class="loginuser" name="b_desc" id="un" />
						<!-- 添加楼宇时默认无人管理 -->
						<input type="hidden" name="user_id" value="0" />
					</li>
					<li>
						楼宇类型<select class="loginsel" name=gender_in >
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</li>
					<li>
					<input id="isp" class="loginerr" readonly="readonly" ></input>	<input style="margin-left: 150px;" type="submit" id="submit"  class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	</c:if>
	

</body>
</html>