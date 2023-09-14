<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>校园宿舍管理系统</title>
		<script language="JavaScript" src="js/jquery.js"></script>
		<script type="text/javascript">
					$(function(){
					});
		</script>
		<link rel="icon" href="images/title3.ico" type="image/x-icon" />
	</head>
	<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frameset cols="187,*" frameborder="no" border="0" framespacing="0">
			<frame src="left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
			<frame src="welcome.html" name="rightFrame" id="rightFrame" title="rightFrame" />
		</frameset>
	</frameset>
	<noframes>

		<body>
		</body>
	</noframes>

</html>