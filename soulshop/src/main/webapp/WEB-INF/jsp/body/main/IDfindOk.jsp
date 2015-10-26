<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 결과페이지</title>

</head>
<body>
<table width="740" cellspacing="0" cellpadding="0" border="0" align="center" >
<tr>
<div align="left">
	  				<td>
	  				<img src="/images/member/findid.gif"  width="750" height="100"/> 	
	  				</td></div>
</tr>
</table>
<hr width="740" size="3" color="59CABD" />
<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">

<tr>
	<td align="center"width="370" height="200"  bgcolor="f3f3f3">
		<font size=3 color=64C9BE><strong>${member.shop_mem_name}</strong></font><font size=2> 님의 아이디는 </font> <font size=3 color=0066cc><strong>${member.shop_mem_id}</strong></font><font size=2> 입니다.</font>
	</td>
</tr>
</table>
<br>




<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">

<tr>
<td>
<div align="center">
<input type="image" src="/images/member/tomain.gif" onclick="location.href='main.soul'"/>
</div>
</td>
</tr>
</table>
</body>
</html>




