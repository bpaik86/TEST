<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
            .button
            {
            background: url(/images/member/join_ok_btn.jpg) no-repeat;
            width:143px;
            height:53px;
            cursor:pointer;
            align:top;
                        border: none;
            }
        </style>
<title></title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#modify").on("click",function(){
			
			 var id = $('input[name=shop_mem_id]').val();
			 var pw = $('input[name=shop_mem_pw]').val();
			 var name = $('input[name=shop_mem_name]').val();
			 var bdt = $('input[name=shop_mem_bdt]').val();
			 var email = $('input[name=shop_mem_email]').val();
			 var cell = $('input[name=shop_mem_cell]').val();
			 var phone = $('input[name=shop_mem_phone]').val();
			 var addr1 = $('input[name=shop_mem_addr1]').val();

			var param="shop_mem_id="+id+"&shop_mem_pw="+pw+"&shop_mem_name="+name+"&shop_mem_bdt="+bdt+"&shop_mem_email="+email
								+"&shop_mem_cell="+cell+"&shop_mem_phone="+phone+"&shop_mem_addr1="+addr1;

			$.ajax({
				url : '/member_update.soul',
				type: 'post',
				data: param,
				dataType: 'text'
			});
			alert("정상적으로 수정 되었습니다.");//지우는것다 리로드가 빨라서 화면 갱신이 안되는거 알림창으로 지연시켜 해결
			/* location.reload(true);  */
			 location.href("/main.soul");   
			
			
		}); 
	});
	 
</script>
</head>
<body>
<form name = "joinform" action = "join.soul" method="post" onsubmit="return check(this)" >	

<table width="740" cellspacing="0" cellpadding="0" border="0" align="center">

<tr>
	<td>
	<table>
		<tr>
			<td width="300" align="left">
			<b>회원정보수정</b>
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
<table class="tableclass" border="1" width="100%" height="80%">

	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2"><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;아이디</font>
		</td>
		<td align="left">
				<input type="text"  name ="shop_mem_id" size="20" value="${member.shop_mem_id}" disabled/>								
		</td>									
	</tr>

				
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;비밀번호</font>
		</td>
		<td align="left">
			<input type="password"  name ="shop_mem_pw" size="20" />
			<font size="2">아이디영문, 숫자, 특수문자 중 2가지 이상</font>
		</td>
	</tr>
				
	<tr>
		<td width="17%" bgcolor="#f5f5f5" align="left">
			<font size="2"><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;이름</font>
		</td>
		<td align="left">
			<input type="text"  name="shop_mem_name" size="20" value="${member.shop_mem_name}"/>
		</td>
	</tr>
			
								
	<tr>
		<td width="17%" bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;생년월일</font>
		</td>
		<td align="left">
			<input type="text"  name="shop_mem_bdt" size="8" maxlength="8" value="${member.shop_mem_bdt}"/>
			<font size="2" >생년월일 양식(YYYYMMDD)</font>
		</td>
		
	</tr>
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;이메일</font>
		</td>
		<td align="left">
			<input type="text"  name="shop_mem_email" size = "30" value="${member.shop_mem_email}"/>
		</td>
	</tr>
	
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;유선전화번호</font>
		</td>
		<td align="left">
			<font size="2" ><input type="text"  name="shop_mem_cell" size = "30" value="${member.shop_mem_cell}" />(- 포함)</font>
		</td>			
	</tr>
   
	<tr>
		<td bgcolor="#f5f5f5" align="left">
			<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;휴대폰전화번호</font>
		</td>
		<td align="left">
			<font size="2" ><input type="text"  name="shop_mem_phone" size = "30" value="${member.shop_mem_phone}"/>(- 포함)</font>
		</td>			
	</tr>
 					
<tr>
	<td bgcolor="#f5f5f5" align="left">
		<font size="2" ><img src="/images/member/bu1.gif"/>&nbsp;&nbsp;주소</font>
	</td>
	<td>
		<input type="text" name="shop_mem_addr1"size="50" value="${member.shop_mem_addr1}">
	</td>
</tr>
				
				
</table><br><br>
			
<table width="100%">
			<tr>
			<td>
			<div align="right">
			<input type="image" id="modify" class="button" align="top" onclick="return false;">
			<a href="main.soul"><img src="/images/member/join_cancel_btn.jpg" alt="취소" height="53" align="top"/></a>
			<br>
			</div>
			</td>
		</tr>
</table>
			</form>
</body>
</html>