<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript">
function check(){
	
	var f=document.joinform;  //문서.Form name="";
	var idPs=/^[a-z0-9_]{4,12}$/;  //아이디 비밀번호 체크표현식
	 
	if(f.shop_mem_id.value==""){
		alert("아이디를 입력해주세요.");
		f.shop_mem_id.focus();
		return false;
	}
	 
	if(!idPs.test(f.shop_mem_id.value)){
		alert("유효한 아이디 형식이 아닙니다.");
		f.shop_mem_id.value="";  //id작성했던 값을 비워줌
		f.shop_mem_id.focus();  //id focus이동
		return false;
	}
	
	if(f.confirm_id.value=="") {
		alert("아이디 중복확인을 해주십시요.");
		return false;
	}
	
	if(f.shop_mem_pw.value==""){
		alert("비밀번호를 입력해주십시요.");
		f.shop_mem_pw.focus();
		return false;
	}
	
	if(f.shop_mem_name.value==""){
		alert("이름을 입력해주십시요.");
		f.shop_mem_name.focus();
		return false;
	}
	
	if(f.shop_mem_bdt.value==""){
		alert("생년월일을 입력하세요.");
		f.shop_mem_bdt.focus();
		return false;
	}
	
	if(f.shop_mem_email.value==""){
		alert("이메일을 입력해주세요.");
		f.shop_mem_email.focus();
		return false;
	}
	
	if(f.shop_mem_cell.value=="") {
		alert("유선전화번호를 입력해주세요.");
		f.shop_mem_cell.focus();
		return false;	
	}
	
	if(f.shop_mem_phone.value=="") {
		alert("휴대전화번호를 입력해주세요.");
		f.shop_mem_phone.focus();
		return false;	
	}
	
	if(f.shop_mem_addr1.value=="") {
		alert("주소를 입력해주세요.");
		f.shop_mem_addr1.focus();
		return false;	
	}
	
}
//아이디중복체크 팝업창
function openConfirmId(joinform){

	var url = "memberIdChkAction.soul?shop_mem_id="+document.joinform.shop_mem_id.value;
	
	var f=document.joinform;  //문서.Form name="";
	  
	var idPs=/^[a-z0-9_]{4,12}$/;  //아이디 비밀번호 체크표현식
	
	if(f.shop_mem_id.value==""){
		alert("아이디를 입력해주세요.");
		f.shop_mem_id.focus();
		return false;
	}
	
	if(!idPs.test(f.shop_mem_id.value)){
		alert("유효한 아이디 형식이 아닙니다.");
		f.shop_mem_id.value="";  //id작성했던 값을 비워줌
		f.shop_mem_id.focus();  //id focus이동
		return false;
	}
	
	open(url ,"confirm","toolbar=no, location=no, status=co, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
}

//우편번호 팝업창
function openZipcode(joinform){
	var url="zipCheckAction.soul";
	open(url, "confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
}

</script>

<title>회원가입 양식</title>
</head>
<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form name = "joinform" action = "join.soul" method="post" onsubmit="return check(this)" >	
<div align="center">
	<img src="/images/member/step2.JPG" alt="회원정보입력"/><br><br><br>
</div>


<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">

<tr>
	<td>
	<table>
		<tr>
			<td width="300" align="left">
			<b>회원정보입력</b>
			</td>
			<td width="440" align="right" >
			<img src="/images/member/bu1.gif"/><font size="2">표시 필수입력사항</font>
			</td>
		</tr>
	</table>
	</td>  
</tr><br/>

	<tr>
		<td colspan=2>
		
		<p align="center">
		  <table border="1" width="100%" height="80%">

	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2"><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;아이디</font>
		</td>
		<td align="left">
			<c:choose>
			<c:when test="${resultClass==null}">
				<input type="text" name ="shop_mem_id" size="20"  />				
				<input type="button" name="confirm_id" value="중복확인" onclick="openConfirmId(this.form)" />
				<font size="2">(영문소문자/숫자, 4~16자)</font></c:when>
			<c:otherwise><b>${resultClass.shop_mem_id}</b></c:otherwise>
			</c:choose>
		</td>			
									
	</tr>

				
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;비밀번호</font>
		</td>
		<td align="left">
			<input type="password" name ="shop_mem_pw" size="20" />
			<font size="2">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</font>
		</td>
	</tr>
				
	<tr>
		<td width="17%" bgcolor="#f5f5f5" align="left">
			<font size="2"><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;이름</font>
		</td>
		<td align="left">
			<input type="text" name="shop_mem_name" size="20"/>
			<font size="2" >이름은 한글로 입력해주세요 </font>
		</td>
	</tr>
			
								
	<tr>
		<td width="17%" bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;생년월일</font>
		</td>
		<td align="left">
			<input type="text" name="shop_mem_bdt" size="8" maxlength="8"/>
			<font size="2" >생년월일 양식(YYYYMMDD)</font>
		</td>
		
	</tr>
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;이메일</font>
		</td>
		<td align="left">
			<input type="text" name="shop_mem_email" size = "30"/>
		</td>
	</tr>
	
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;유선전화번호</font>
		</td>
		<td align="left">
			<font size="2" ><input type="text" name="shop_mem_cell" size = "30"/>(- 포함)</font>
		</td>			
	</tr>
   
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;휴대폰전화번호</font>
		</td>
		<td align="left">
			<font size="2" ><input type="text" name="shop_mem_phone" size = "30"/>(- 포함)</font>
		</td>			
	</tr>
 					
<tr>
	<td bgcolor="#f5f5f5" align="left">
		<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;주소</font>
	</td>
	<td>
		<input type="text" name ="shop_zip" value="${resultClass.shop_zip}" size="8" readonly/>
		<input type="button" name="zipcodea" value="우편번호 검색" onclick="openZipcode(this.form)" /><br>		
		<input type="text" name="shop_mem_addr1" value="${resultClass.shop_mem_addr1}" size="50" />
		<font size="2">상세 주소 입력하세요</font>
	</td>
</tr>
				
				
</table><br><br>
			
<table width="100%">
			<tr>
			<td>
			<div align="right" >
			<input type="image" value="회원가입" src="/images/member/join_btn.jpg" alt="확인" align="top">
			<a href="main.soul"><img src="/images/member/join_cancel_btn.jpg"  align="top"></a></a>
			<br>
			</div>
			</td>
			</tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
      </form>
</body>
</html>