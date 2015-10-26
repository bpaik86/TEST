<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<script></script>
</head>
<body>
<table  border="1" align="center" width="1200">

<tr>
	<tiles:insertAttribute name="header" />
</tr>

<tr>
	<tiles:insertAttribute name="body" />
</tr>

<tr>
	<tiles:insertAttribute name="footer" />
</tr>
</table>
</body>
</html>