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
<!-- 添加学生 -->
	<c:if test="${aUser.identity==0 }">
	<form action="${ctx }/user_addUser.action" method="post" onsubmit="return checkForm()" target="_parent" >
		<div id="addUser">
				<ul>
					<li>
						学生姓名<input class="loginuser" name="username" id="un" />
					</li>
					<li>
						登录账号<input class="loginuser" name="usercode" id="uc" placeholder="例如：20160630231" /><a id="userSpan" ></a>
					</li>
					<li>
						<!--初次添加可以登录登录-->
						<input type="hidden" name="state" value="1" />
						<input type="hidden" name="building_id" value="0" />
						<!--添加学生时未入住-->
						<input type="hidden" name="check_in" value="0" />
						<!--学生身份为0-->
						<input type="hidden" name="identity" value="0" />
						登录密码<input class="loginuser" name="password" id="up" maxlength="6"placeholder="6位" />
					</li>
					<li>
						学生电话<input class="loginuser" name="phone" id="uph" />
					</li>
					<li>
						学生性别<select class="loginsel" name="gender" >
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
	
<!-- 添加管理员 -->
	<c:if test="${aUser.identity==1 }">
	<form action="${ctx }/user_addUser.action" method="post" onsubmit="return checkForm()" target="_parent" >
		<div id="addUser">
				<ul>
					<li>
						老师姓名<input class="loginuser" name="username" id="un" />
					</li>
					<li>
						登录账号<input class="loginuser" name="usercode" id="uc" placeholder="例如：88888888" /><a id="userSpan"></a>
					</li>
					<li>
						<!--初次添加可以登录登录-->
						<input type="hidden" name="state" value="1" />
						<!--初次添加可以登录登录-->
						<input type="hidden" name="building_id" value="0" />
						<!--学生身份为0-->
						<input type="hidden" name="identity" value="1" />
						登录密码<input class="loginuser" name="password" id="up" maxlength="6"placeholder="6位" />
					</li>
					<li>
						老师电话<input class="loginuser" name="phone" id="uph"/>
					</li>
					<li>
					老师性别<select class="loginsel" name="gender" >
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