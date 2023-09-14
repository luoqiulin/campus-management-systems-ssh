<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>楼宇管理员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	$(function() {
		
		var check_in = document.getElementById("check_in").value;
		document.getElementById("s3").value=check_in;

		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

		$("#sel").change(function() {
			var selectName = document.getElementById("sel").value;
			var s1 = document.getElementById("s1");
			var s2 = document.getElementById("s2");
			var s3 = document.getElementById("s3");
			var s4 = document.getElementById("s4");
			if (selectName == "username") {
				s1.style.display = "block";
				s2.style.display = "none";
				s3.style.display = "none";
				s4.style.display = "none";
			} else if (selectName == "gender") {
				s1.style.display = "none";
				s2.style.display = "block";
				s3.style.display = "none";
				s4.style.display = "none";
			} else if (selectName == "phone"||selectName=="check_in") {
				s1.style.display = "none";
				s2.style.display = "none";
				s3.style.display = "block";
				s4.style.display = "none";
			} else {
				s1.style.display = "none";
				s2.style.display = "none";
				s3.style.display = "none";
				s4.style.display = "block";
			}
		});


		/* $("#cl").click(function(){
			
			alert(1);
			document.getElementById("s1").value=" ";
			document.getElementById("s2").value=" ";
			document.getElementById("s3").value=" ";
			document.getElementById("s4").value=" ";
		}); */

	});
	
	function asubmit(pageCode) {
		document.getElementById("pageCode").value = pageCode;
		document.getElementById("pageform").submit(); 
	}
</script>

</head>

<body>
	<form action="${ctx }/user_findByPageUI.action" method="post" id="pageform" target="rightFrame">

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<c:if test="${model.identity==1 }">
					<li>楼宇管理员管理</li>
				</c:if>
				<c:if test="${model.identity==0 }">
					<li>学生管理</li>
				</c:if>
				
			</ul>
		</div>
		<input type="hidden" value="${model.check_in }" id="check_in">
		<div class="rightinfo">
			<div class="tools">
				<input type="hidden" id="pageCode" name="pageCode" value="1">
				<input type="hidden" name="identity" value="${model.identity }">
				<ul class="toolbar">
					<li><a href="${ctx}/user_addUserUI.action?identity=${model.identity }" target="rightFrame">
						<span><img src="images/t01.png" /></span>添加<c:if test="${model.identity==1 }">管理员</c:if>
																<c:if test="${model.identity==0 }">学生</c:if>
					</a></li>
					
					<li style="margin-left: 15px;"><span style="margin-top: 1px;">查询:</span>
						<span><select id="sel" style="width: 60px; height: 20px;"
							onchange="selectAdmin()">
								<option value="username">姓名</option>
								<option value="gender">性别</option>
							<c:if test="${model.identity==1 }">
								<option value="phone">电话</option>
							</c:if>
							<c:if test="${model.identity==0 }">
								<option value="check_in">入住状态</option>
							</c:if>

								<option value="usercode">用户名</option>
						</select></span> <span id="inputsp"> <input type="text" id="s1"
							class="show" name="username" value="${model.username }"
							style="height: 24px;" /> <input type="text" id="s2" class="hidd"
							name="gender" value="${model.gender }" style="height: 24px;" />
							<c:if test="${model.identity==1 }"><input type="text" id="s3" class="hidd" name="phone" value="${model.phone }" style="height: 24px;" /></c:if>
							<c:if test="${model.identity==0 }">
								<select id="s3" class="hidd" name="check_in">
									<option value="">请选择</option>
									<option value="0">未入住</option>
									<option value="1">已入住</option>
									<option value="2">已迁出</option>
								</select>
							</c:if>
							 
							
							
							<input type="text" id="s4" class="hidd" name="usercode" value="${model.usercode }" style="height: 24px;" />
					</span></li>
					<li><input type="submit" value="点击查询" style="width: 55px; background-color: #F0F5F7; font-size: 12px; margin-left: 7px; margin-top: 7px;" /></li>
					<li><a href="${ctx }/user_findByPageUI.action?identity=${model.identity }&pageCode=1"><input id="cl" value="清除条件" style="width: 55px; background-color: #F0F5F7; font-size: 12px; margin-left: 7px; margin-top: 7px;" /></a></li>
				</ul>
			</div>

			<table class="tablelist">
				<thead style="text-align: center;">
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<c:if test="${model.identity==0 }">
							<th>学号</th>
						</c:if>
						<c:if test="${model.identity==1 }">
							<th>用户名</th>
						</c:if>
						<c:if test="${model.identity==1 }"><th>电话</th></c:if>
						
						<c:if test="${model.identity==0 }"><th>入住状态</th></c:if>
						<th style="width: 150px;">操作</th>
					</tr>
				</thead>
				<tbody>

					<s:iterator value="pageBean.beanList" status="s">
						<tr>
							<td><s:property value="#s.index+1" /></td>
							<td><s:property value="username" /></td>
							<td><s:property value="gender" /></td>
							<td><s:property value="usercode" /></td>
							<!-- 管理员 -->
							<c:if test="${model.identity==1 }"><td><s:property value="phone" /></td></c:if>
							<!-- 学生 -->
							<c:if test="${model.identity==0 }">
								<c:if test="${check_in==0 }"><td>未入住</td></c:if>
								<c:if test="${check_in==1 }"><td>已入住</td></c:if>
								<c:if test="${check_in==2 }"><td>已迁出</td></c:if>
							</c:if>
							
							<td><a href="${ctx }/user_updateUserUI.action?user_id=<s:property value="user_id" />" class="tablelink">查看</a> 
							<c:if test="${model.identity==1 }">
								<a href="${ctx }/user_deleteAdmin.action?user_id=<s:property value="user_id" />" target="_parent" class="tablelink" onclick="confirm('确定删除管理员?')">删除</a>
							</c:if>	
							</td>
						<tr />
					</s:iterator>
				</tbody>
			</table>

			<div class="pagin">
				<div class="message">
					共<i class="blue">${pageBean.totalCount }</i>条记录，当前显示第&nbsp;<i
						class="blue">${pageBean.pageCode }&nbsp;</i>页
				</div>
				<ul class="paginList">
					<!-- 判断当前页面是否为1   若不为1则显示左边的箭头 -->
					<c:if test="${pageBean.pageCode!=1 }">
						<li class="paginItem"><a onclick="asubmit('${pageBean.pageCode-1}')"><span class="pagepre"></span></a></li>
					</c:if>

					<c:if test="${pageBean.pageCode==1 }">
						<li class="paginItem"><a onclick="javascript:void(0);"><span class="pagepre"></span></a></li>
					</c:if>

					<c:forEach begin="1" end="${pageBean.totalPage }" var="n">
						<c:if test="${n>pageBean.pageCode-5&&n<pageBean.pageCode+6 }">
							<c:if test="${n!=pageBean.pageCode }">
								<li class="paginItem"><a onclick="asubmit('${n}')">${n }</a></li>
							</c:if>
							<c:if test="${n==pageBean.pageCode }">
								<li class="paginItem"><a onclick="javascript:void(0)">${n }</a></li>
							</c:if>
						</c:if>
					</c:forEach>

					<!-- 判断是否是最后一页 -->
					<c:if test="${pageBean.pageCode == pageBean.totalPage }">
						<li class="paginItem"><a onclick="javascript:void(0)"
							aria-label="Next"> <span class=""></span>
						</a></li>
					</c:if>
					<c:if test="${pageBean.pageCode != pageBean.totalPage }">
						<li class="paginItem"><a
							onclick="asubmit('${pageBean.pageCode+1}')" aria-label="Next">
								<span class="pagenxt"></span>
						</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>

</html>