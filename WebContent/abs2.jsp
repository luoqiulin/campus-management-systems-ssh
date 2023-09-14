<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<form action="${ctx }/absenteeRecord_showMe.action" method="post" id="pageform">
	<input type="hidden" id="pageCode" name="pageCode" value="1">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
					<li>我的缺勤记录</li>
			</ul>
		</div>
		<div class="rightinfo">
			<s:debug></s:debug>

			<table class="tablelist">
				<thead style="text-align: center;">
					<tr>
						<th>楼宇栋号</th>
						<th>学生学号</th>
						<th>记录者id</th>
						<th>缺勤时间</th>
						<th>缺勤原因</th>
						<th>缺勤次数</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${absPage.beanList }" var="a">
						<tr>
							<td>${a.buildingId }栋</td>
							<td>${a.user.usercode }</td>
							<td>${a.t_u_user }</td>
							<td>${a.absentee_date }</td>
							<td>${a.absentee_desc }</td>
							<td>${fn:length(a.user.absenteeRecords)}</td>
						<tr />
					</c:forEach>
				</tbody>
			</table>

			<div class="pagin">
				<div class="message">
					共<i class="blue">${absPage.totalCount }</i>条记录，当前显示第&nbsp;<i
						class="blue">${absPage.pageCode }&nbsp;</i>页
				</div>
				<ul class="paginList">
					<!-- 判断当前页面是否为1   若不为1则显示左边的箭头 -->
					<c:if test="${absPage.pageCode!=1 }">
						<li class="paginItem"><a onclick="asubmit('${absPage.pageCode-1}')"><span class="pagepre"></span></a></li>
					</c:if>

					<c:if test="${absPage.pageCode==1 }">
						<li class="paginItem"><a onclick="javascript:void(0);"><span class="pagepre"></span></a></li>
					</c:if>

					<c:forEach begin="1" end="${absPage.totalPage }" var="n">
						<c:if test="${n>absPage.pageCode-5&&n<absPage.pageCode+6 }">
							<c:if test="${n!=absPage.pageCode }">
								<li class="paginItem"><a onclick="asubmit('${n}')">${n }</a></li>
							</c:if>
							<c:if test="${n==absPage.pageCode }">
								<li class="paginItem"><a onclick="javascript:void(0)">${n }</a></li>
							</c:if>
						</c:if>
					</c:forEach>

					<!-- 判断是否是最后一页 -->
					<c:if test="${absPage.pageCode == absPage.totalPage }">
						<li class="paginItem"><a onclick="javascript:void(0)" aria-label="Next"> 
						<span class="pagenxt"></span>
						</a></li>
					</c:if>
					<c:if test="${absPage.pageCode != absPage.totalPage }">
						<li class="paginItem"><a onclick="asubmit('${absPage.pageCode+1}')" aria-label="Next">
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