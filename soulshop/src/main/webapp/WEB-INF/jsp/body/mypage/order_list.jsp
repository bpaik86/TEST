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

<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="1200" align="center"><tr><td>
<img src="/images/item/order_list.gif"></td></tr></table>
<table width="1200" height="55" border="0" align="center" cellpadding="1" cellspacing="1">
		<thead>
			<tr >
				<th width="" align="center"><h3>주문번호</h3></th><th><h3>상품명</h3></th><th><h3>주문날짜</h3></th><th><h3>수량</h3></th><th><h3>가격</h3></th><th><h3>받는 분</h3></th><th><h3>주소</h3></th><th><h3>연락처</h3></th><th><h3>배송상태</h3></th>
			</tr>
		</thead>
		<tbody class="tbody">
		<c:forEach var="order" items="${orderList}">
			<tr>
				<td height="28"  align="center"> <font size="2" color="9b9b9b">${order.order_no }</font></td>
			  <td align="center">	<font size="2" color="9b9b9b"><a href="/item_view.soul?ITEM_ID=${order.item_id}">${order.item_name }</a></font></td>
				<td align="center">	<font size="2" color="9b9b9b">${order.date }</h4></td>
				<td align="center"><font size="2" color="9b9b9b">${order.item_count }</font></td>
				<td align="center"><font size="2" color="9b9b9b">${order.total_price}</font></td>
				<td align="center"><font size="2" color="9b9b9b">${order.receiver_name}</font></td>
				<td align="center"><font size="2" color="9b9b9b">${ order.receiver_addr}</font></td>
				<td align="center"><font size="2" color="9b9b9b">${order.receiver_phone}</font></td>
				<td align="center"><font size="2" color="9b9b9b">${order.status}</font></td>
			</tr>
		</c:forEach>
        <tr><td colspan="9"><hr color="2a83da" size="1"></td></tr>
		</tbody>
	</table>
</body>
</html>