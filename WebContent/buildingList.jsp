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
		var gender_in = document.getElementById("gender_in").value;
		document.getElementById("s3").value=gender_in;

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

	});
	
	function asubmit(pageCode) {
		document.getElementById("pageCode").value = pageCode;
		document.getElementById("pageform").submit(); 
	}
</script>

</head>

<body>
	<form action="${ctx }/building_findByPageUI.action" method="post" id="pageform">

		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
					<li>楼宇管理</li>
			</ul>
		</div>
		<!-- 用于回写的隐藏输入框 -->
		<input type="hidden" value="${model.gender_in }" id="gender_in">
		<div class="rightinfo">
			<div class="tools">
				<input type="hidden" id="pageCode" name="pageCode" value="1">
				<ul class="toolbar">
					<li><a href="${ctx}/building_addBuildingUI.action" target="rightFrame" >
						<span><img src="images/t01.png" /></span>添加楼宇
					</a></li>
					
					<li style="margin-left: 15px;">
						<span style="margin-top: 1px;">简介:</span>
						<span id="inputsp"> 
								<input type="text" id="s1" class="show" name="b_desc" value="${model.b_desc}" style="height: 24px;" />
									
						</span>
					</li>
					<li>
						<span>
							<select id="s3" class="show" name="gender_in">
										<option value="">请选择</option>
										<option value="男">男</option>
										<option value="女">女</option>
							</select>
						</span>
					</li>
					<li><input type="submit" value="点击查询"
						style="width: 55px; background-color: #F0F5F7; font-size: 12px; margin-left: 7px; margin-top: 7px;" /></li>
					<li>
						<a href="${ctx }/building_findByPageUI.action?pageCode=1">
							<input id="cl" value="清除条件" style="width: 55px; background-color: #F0F5F7; font-size: 12px; margin-left: 7px; margin-top: 7px;" />
						</a>
					</li>
				</ul>
			</div>

			<table class="tablelist">
				<thead style="text-align: center;">
					<tr>
						<th>名称</th>
						<th>简介</th>
						<th>管理人员</th>
						<th>入住性别</th>
						<th style="width: 150px;">操作</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${bList.beanList }" var="b">
						<tr>
							<td>${b.building_id }栋</td>
							<td>${b.b_desc }</td>
							
							<td>
							<!--有无人管理  -->
							<c:if test="${b.user_id==0 }">无</c:if>
							<c:if test="${b.user_id!=0 }">有</c:if>
							</td>
							
							<td>${b.gender_in }</td>
							
							<td>
								<a href="${ctx }/building_updateBuildingUI.action?building_id=${b.building_id}" class="tablelink">查看</a> 
								<!-- 无人管理则可添加管理员 -->
								<c:if test="${b.user_id==0 }">
									<a href="${ctx }/building_addBuildingAdminUI.action?building_id=${b.building_id}" class="tablelink">添加管理员</a>
								</c:if>
								<!-- 又热管理则可更换管理员 -->
								<c:if test="${b.user_id!=0 }">
									<a href="${ctx }/building_addBuildingAdminUI.action?building_id=${b.building_id}" class="tablelink">更换管理员</a>
								</c:if>
							</td>
						<tr />
					</c:forEach>
				</tbody>
			</table>

			<div class="pagin">
				<div class="message">
					共<i class="blue">${bList.totalCount }</i>条记录，当前显示第&nbsp;<i
						class="blue">${bList.pageCode }&nbsp;</i>页
				</div>
				<ul class="paginList">
					<!-- 判断当前页面是否为1   若不为1则显示左边的箭头 -->
					<c:if test="${bList.pageCode!=1 }">
						<li class="paginItem"><a onclick="asubmit('${bList.pageCode-1}')"><span class="pagepre"></span></a></li>
					</c:if>

					<c:if test="${bList.pageCode==1 }">
						<li class="paginItem"><a onclick="javascript:void(0);"><span class="pagepre"></span></a></li>
					</c:if>

					<c:forEach begin="1" end="${bList.totalPage }" var="n">
						<c:if test="${n>bList.pageCode-5&&n<bList.pageCode+6 }">
							<c:if test="${n!=bList.pageCode }">
								<li class="paginItem"><a onclick="asubmit('${n}')">${n }</a></li>
							</c:if>
							<c:if test="${n==bList.pageCode }">
								<li class="paginItem"><a onclick="javascript:void(0)">${n }</a></li>
							</c:if>
						</c:if>
					</c:forEach>

					<!-- 判断是否是最后一页 -->
					<c:if test="${bList.pageCode == bList.totalPage }">
						<li class="paginItem"><a onclick="javascript:void(0)" aria-label="Next"> 
						<span class="pagenxt"></span>
						</a></li>
					</c:if>
					<c:if test="${bList.pageCode != bList.totalPage }">
						<li class="paginItem"><a onclick="asubmit('${bList.pageCode+1}')" aria-label="Next">
						<span class="pagenxt"></span>
						</a></li>
					</c:if>
				</ul>
			</div>

			<div class="tip">
				<div class="tiptop">
					<span>提示信息</span> <a></a>
				</div>

				<div class="tipinfo">
					<span><img src="images/ticon.png" /></span>
					<div class="tipright">
						<p>是否确认对信息的修改 ？</p>
						<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
					</div>
				</div>

				<div class="tipbtn">
					<input name="" type="button" class="sure" value="确定" />&nbsp; <input
						name="" type="button" class="cancel" value="取消" />
				</div>

			</div>

		</div>
	</form>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>

</html>