<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 입력페이지</title>

<script type="text/javascript">

function memberFindChk() {
	
	var mem= eval("document.memberFindForm"); 
	
	if(mem.shop_mem_name.value=="") { //이름 입력
        alert('이름을 입력하세요'); 
        mem.shop_mem_name.focus();
        return false;
    }

    if(mem.shop_mem_email.value=="") { //이메일 입력
        alert('이메일을 입력하세요');
        mem.shop_mem_email.focus();
        return false;
    }
	
	return true;
}
</script>
</head>
<body>



<form name="memberFindForm" action="find_id.soul" method="post" onsubmit="return memberFindChk()"> <!-- 아이디찾기경로설정 -->
<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
	<div align="left">
	  	<td>
	  		<img src="/images/member/findid.gif" width="750" height="100"/> 	
	  	</td>
	</div>
</tr>
</table><br>

<table width="740" height="150" bgcolor="f3f3f3" cellspacing="0" cellpadding="0" border="0" align="center">
<tr align="center">
	<td >
		<b>이름 : </b>
		<input name="shop_mem_name" type="text" size ="20"/><br></br>
		<b>이메일 :</b>
		<input name="shop_mem_email" type="text" size ="20"/> 
	</td>
</tr>
<tr align="center">
	<td>
		<input type="image" src="/images/member/find_id.jpg"/>
	</td>
</tr>
</table>
<br>



</form>
</body>
</html>


