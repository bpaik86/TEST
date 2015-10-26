<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script type="text/javascript"></script>
</head>
<body>
<img  src='<c:url value="/resources/upload/menu_item_insert.png" />'>
<c:forEach var="images" items="${imageList }">
	<div><img src="${images.filename }"/></div>
</c:forEach>
<!-- <img  src="Z:\eclipse\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\soulshop\resources\upload\2da347ef-d6c.Desert.jpg"> -->
</body>
</html>