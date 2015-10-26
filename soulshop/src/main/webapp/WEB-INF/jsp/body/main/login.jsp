<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

<link rel="stylesheet" type="text/css" href="/css/footer/footer.css">
</head>
<body>
<p>&nbsp;</p>
<p><br>
  <br>
</p>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><img src="/images/mypage/login_head.jpg" align="center"></td>
  </tr>
</table>
    <p>&nbsp;</p>
    <table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody>
			<tr>
				<td width="1200" valign="top"
					style="border-top: solid 1px #e9e9e9; border-right: solid 1px #e9e9e9; border-bottom: solid 1px #e9e9e9; padding-left: 40px;">

					<form action="loginCheck.soul" name="login" method="Post">
						<table border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td height="45" colspan="2"></td>
								</tr>
								<tr>
									<td width="55" height="30">아이디</td>
									<td width="230"><input name="shop_mem_id" tabindex="1"
										size="20" maxlength="15" onkeydown="next()"
										style="border: 1px solid #d9d9d9; color: #616161; FONT-FAMILY: 돋움; FONT-SIZE: 13px; width: 230px; height: 24px; padding-top: 6px; ime-mode: inactive;"></td>
									<td width="105" height="60" rowspan="2" align="right">
									<input type="image"  value="로그인" src="/images/member/login/login_bt.gif" /></td>
								</tr>
								
								<tr>
									<td height="30">비밀번호</td>
									<td><input type="password" name="shop_mem_pw" maxlength="15"
										tabindex="2" size="20" onkeydown="push()"
										style="border: 1px solid #d9d9d9; color: #616161; FONT-FAMILY: 돋움; FONT-SIZE: 13px; width: 230px; height: 24px; padding-top: 6px"></td>
								</tr>
								<tr>
									
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="2">
										<!--자동로그인/아이디저장-->
										<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td width="20"><input type="checkbox" name="saveid"
														id="saveid" onclick="confirmSave(this)" value="Y"></td>
													<td><span class="m_title31">아이디 저장</span></td>
													<td width="15"></td>
													<td width="20"><input type="checkbox" name="autologin"
														id="autologin" onclick="confirmAutologin(this)" value="Y"></td>
													<td><span class="m_title31">로그인 상태유지</span></td>
												</tr>
											</tbody>
										</table> <!--자동로그인/아이디저장-->
									</td>
								</tr>
							</tbody>
						</table>
					</form>


				</td>
				<td align="right" valign="top" width="1200"
					style="border-top: solid 1px #e9e9e9; border-bottom: solid 1px #e9e9e9; padding-right: 40px;">

				  <table border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="45"></td>
							</tr>
							<tr>
								<td>
								<input type="image" src="/images/member/login/login_bt01.gif" onclick="window:location='agreement.soul'" value="회원가입"/>
								</td>
							</tr>
							<tr>
								<td height="15"></td>
							</tr>
							<tr>
								<td>
								<input type="image" src="/images/member/login/login_bt02.gif" onclick="window:location='find_idAction.soul '" value="아이디 찾기"/>
								</td>
							</tr>
							<tr>
								<td height="15"></td>
							</tr>
							<tr>
								<td>
								<input type="image" src="/images/member/login/login_bt03.gif" onclick="window:location='find_pwAction.soul '" value="비밀번호 찾기"/>
								</td>
							</tr>
							<tr>
								<td height="45"></td>
							</tr>
						</tbody>
				  </table>


				</td>
			</tr>
	  </tbody>
</table>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <br>
    <br>
</body>
</html>