<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script type="text/javascript"></script>
</head>
<body>
<div>
<h1>�ӽ� ����â</h1>
<form action="order_list.soul" method="post">
	<table width="1200" cellspacing="1" cellpadding="1" border="1" align="center">
		<tr>
			<td>���� ��ǰ</td>
			<td>
				<c:forEach var="item_name" items="${orderList.item_name }">${item_name } &nbsp;&nbsp;</c:forEach>
			</td>
		</tr>
		<tr>
			<td>�� ���� �ݾ�</td>
			<td>${pay_price }<input type="hidden" name="pay_price" value="${pay_price }"></td>
		</tr>
	</table>
	<input type="submit" value="���� Ȯ��" />
</form>
</div>
</body>
</html>