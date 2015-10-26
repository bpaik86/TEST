<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>

<title>주소/우편번호 검색</title>

<script language="JavaScript">
	function dongCheck(){
		if(document.zipForm.area3.value=="") {
			alert("동이름을 입력하세요");
			document.zipForm.area3.focus();
			return;
		}
		document.zipForm.submit();
	}

	function sendAddress(zipcode,area1,area2,area3,area4) {
		var address =area1+ " "+area2+ " " +area3+ " " +area4;
		opener.document.joinform.shop_zip.value=zipcode; 
		opener.document.joinform.shop_mem_addr1.value=address;
		self.close();
	}

</script>

</head>
 <body style="leftmargin:0; topmargin:0; marginwidth:0; marginheight:0;" onload="zipForm.text.focus()">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30">&nbsp; 
        <font color="#FFFFFF" size="2"><b>우편번호 검색</b></font></td>
    </tr>
    </table>
	
	<form name="zipForm" method="post" action="zipCheckAction.soul">
    <table width="390" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="40"></td></tr>
    <tr>
        <td align="center">
            <input type="text" name="dong" value="${dong}" size="20" maxlength="30" style="ime-mode:active;" />
            <input type="submit" value="검 색" onclick="dongCheck()" />
        </td>
    </tr>
    <tr><td height="30"></td></tr>
    <tr class="d">
   		<td height="40" align="center">
          	<b>동</b> 으로 검색해 주세요.<br/>
            <font color="#0000FF">(예: 압구정동/개포1동/당동)</font>
        </td>
    </tr>
    <tr><td height="20"></td></tr>
    <tr class="d">
        <td align="center">
        	검색결과가 나오면 맞는 부분을 클릭하시면 <br/>
        	자동으로 주소와 우편번호란에 채워집니다
        </td>
    </tr>
    </table>
    </form>
    

	<c:forEach var="zipCode" items="${zipcodeList}" varStatus="rowStatus">
    <span style="cursor:pointer; display:block; margin-top:10px;" onclick="javascript:sendAddress(
    '${zipCode.zipcode}',
    '${zipCode.area1}',
    '${zipCode.area2}',
    '${zipCode.area3}',
    '${zipCode.area4}'
    )">
    ${zipCode.zipcode}&nbsp;
    ${zipCode.area1}
    ${zipCode.area2}
    ${zipCode.area3}
    ${zipCode.area4}
    </span>
    </c:forEach>
    <div style="text-align:center; margin-top:10px;">
    <a href="javascript:this.close();">닫기</a>
    </div>
</body>
</html>