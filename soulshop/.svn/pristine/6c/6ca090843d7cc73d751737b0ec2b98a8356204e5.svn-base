<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>공지사항</title>
	
	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.subject.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} 
			
			else if(frm.name.value == "") {
				alert("이름을 입력해주세요.");
				return false;
			}
			
			else if(frm.password.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			else if(frm.content.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>
  
  <body>
 <table cellpadding="0" style="margin-left:0px; width:100%;" >
 	<tr>
 		<td width="280px" style="padding-top:50px; padding-left:20px; vertical-align:top;">
   <div style="width:149px;text-align:right; font-size:20px; font-family:굴림;">
	<b>관리자 모드</b>
</div>
<div style="width:149px;text-align:center">
		    <table border="0">
		    <tr><td  height="26px" background="/TeraBox/image/button/left_menu_bg.gif" style="padding-left:50px;">
		    	<a href="movieAdmin.do">영화관리</a>
		    </td></tr>
		    <tr><td width="149px" height="26px" background="/TeraBox/image/button/left_menu_bg.gif" style="padding-left:50px;">
		    	<a href="timeTableAdmin.do">시간표관리</a>
		    </td></tr> 
		    <tr><td width="149px" height="26px" background="/TeraBox/image/button/left_menu_bg.gif" style="padding-left:50px;">
		    	<a href="noticeForm.do">공지사항쓰기</a>
		    </td></tr>
		    <tr><td width="149px" height="26px" background="/TeraBox/image/button/left_menu_bg.gif" style="padding-left:50px;">
		    	<a href="qnaList.do">1대1문의확인</a>
		    </td></tr>
		    </table> 
 		</div>
 	</td>	
 	<td>	
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
	  				<td>
	  				<img src="/TeraBox/image/title/board_notice.png" /> 	
	  				</td>	
  		</tr>
  	</table>
  
  	<c:choose>
		<c:when test="${notice == NULL}">
			<form action="noticeWrite.do" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		</c:when>
		
		<c:otherwise>
		  <form action="noticeModify.do" method="post" enctype="multipart/form-data">
		  <input type="hidden" name="no" value="${notice.no}" />
		  <input type="hidden" name="currentPage" value="${currentPage}" />
		  <input type="hidden" name="old_file" value="${notice.file_savname}" />
		</c:otherwise>
	</c:choose>

       <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  제목</td>
          <td width="500" bgcolor="#FFFFFF">
            <input type="text" name="subject" theme="simple" value="${notice.subject}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이름 </td>
          <td bgcolor="#FFFFFF">
            <input type="text" name="name" theme="simple" value="${notice.name}" cssStyle="width:100px" maxlength="30"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비밀번호 </td>
          <td bgcolor="#FFFFFF">
            <input type="password" name="password" theme="simple" value="${notice.password}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <textarea name="content" cols="50" rows="10">${notice.content}</textarea>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
       
 
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input type="submit" name="submit" value="작성완료" class="inputb">
            <input type="button" name="list" value="목록" class="inputb" onClick="javascript:location.href='noticeList.do'">
          </td>
        </tr>

    </table>
    </form>
    </td>
    </tr>
    </table>
  </body>
</html>
