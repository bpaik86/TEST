<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 양식</title>
<link rel="stylesheet" type="text/css">
<script>
	window.onload = function(){
		<%-- var chk =  "<%=session.getAttribute("member")%>"
			alert(chk);
		if(chk == "null"){
			alert("로그인페이지");
			
		}else{
			
			alert("이미 로그인 중입니다. 중복 로그인은 불가능합니다.");
			location.href("/main.soul")
		} --%>
		
		/* if(chk !=null){
		} */
		
	}
</script>
</head>
<body>
<img align="center" width="150" src="/images/title/login.PNG">
<br>
<br>

<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
		<tr align="center" height="30">
			<td width="166">
				<img src="/images/member/login1.png" width="200" height="166" border="0">
			</td>
		</tr>		
		
		<tr align="center" border="0" cellspacing="0" cellpadding="0">
			<td width="300">
				<form action="loginCheck.soul" method="post" > <!-- action="로그인주소입력" -->
					<input type="text" name="shop_mem_id" size="20" maxlength="20" placeholder="아이디" />
					<br><br/> 
					<input type="password" name="shop_mem_pw" size="20" maxlength="20" placeholder="비밀번호"/> 
			</td>
			<td>
					<br/>
					<input type="submit"  value="로그인"  />
					<br><br/>
				</form>
			</td>
		</tr>
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td border="0" cellspacing="0" cellpadding="0">
			<input type="image" src="/images/member/login/login_bt02.gif" onclick="window:location='agreement.soul'" value="회원가입"/>
		</td>
	
		<td>
			<input type="image" src="/images/member/login_id_btn.jpg" onclick="window:location='find_idAction.soul '" value="아이디 찾기"/>
			<input type="image" src="/images/member/login_pass_btn.jpg" onclick="window:location='find_pwAction.soul '" value="비밀번호 찾기"/>
		</td>
	</tr>
	<tr align="center" height="10">
		<td width="166"></td>
	</tr>
	
</table>

<br>
<br>
<br>
<br>

</body>
</html>