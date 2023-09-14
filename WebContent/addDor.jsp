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
<!-- 添加宿舍  -->
	<form action="${ctx }/dormitory_addDor.action" method="post" onsubmit="return checkForm()" target="rightFrame" >
		<div id="addUser">
				<ul>
					
					<li>
						选择楼宇
						<select class="loginsel" name="building.building_id" >
						<c:forEach items="${bud.beanList }" var="b">
							<option value="${b.building_id }">${b.b_desc }</option>
						</c:forEach>
						</select>
					</li>
					<li>
						宿舍名称<input class="loginuser" placeholder="例如：607"  name="dormitory_name"  />
						<input type="hidden" name="dor_Mnumber" value="6"  />
						<input type="hidden" name="dor_number" value="0"  />
						<input type="hidden" name="gender_in" value="${bud.beanList[0].gender_in }"  />
					
					</li>
					<li>
						宿舍电话<input class="loginuser" name="dor_phone"/>
					</li>
					<li>
					<input style="margin-left: 150px;" type="submit" id="submit"  class="loginbtn" />
					</li>
				</ul>
				
			</div>
	</form>
	

</body>
</html>