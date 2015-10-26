<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>패스워드 찾기 입력페이지</title>

<script type="text/javascript">

function memberFindChk() {
	
	var mem= eval("document.memberFindForm2"); 
	
	if(mem.name.value=="") {
        alert('이름을 입력하세요'); //이름을 입력
        mem.shop_mem_name.focus();
        return false;
    }

    if(mem.email.value=="") {
        alert('이메일을 입력하세요'); //이메일을 입력
        mem.shop_mem_email.focus();
        return false;
    }
	
	return true;
}
</script>
</head>
<body>



<form name="memberFindForm2" action="find_pw.soul" method="post" onsubmit="return memberFindChk()"> 
<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<div align="left">
	<td>
		<img src="/images/member/findpw.gif" width="750" height="100"/> 	
	</td>
</div>
</tr>
</table><br>

<table width="740" height="150" bgcolor="f3f3f3" cellspacing="0" cellpadding="0" border="0" align="center">
<tr align="center">
	<td >
		<b>이름 : </b>
		<input name="shop_mem_name" type="text" size ="20"/><br></br>
		<b>이메일 : </b>
		<input name="shop_mem_email" type="text" size ="20"/> 
	</td>
</tr>
<tr align="center">
	<td><input type="image" src="/images/member/find_pw.jpg"/></td>
</tr>
</table>
<br>

</form>
</body>
</html>


