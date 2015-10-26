<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function selectAll(obj1,obj2){
		var chks=document.getElementsByName(obj1);
		var Allchk=document.getElementById(obj2);

		if(Allchk.checked==true){
			for(i=0;i<chks.length;i++){
				chks[i].checked=true;
			}
		}else{
			for(i=0;i<chks.length;i++){
				chks[i].checked=false;
			}
		}
	}
	
	$(document).ready(function() {
		$("#delete").on("click",function(){
			
			if($(".checkclass :checked").size()<1){
				alert("�ϳ� �̻��� �׸��� �����ϰ� ���� ��ư�� �����ּ���");
				return false;
			}else{
				var isOk=confirm("���� �����Ͻðڽ��ϱ�?");
				if(isOk==true){
					var param="";
					$(".checkclass :checked").each(function(){
						if(param==""){
							param="shop_mem_id="+$(this).parent().children("#shop_mem_id").val();
						}else{
							param=param+"&shop_mem_id="+$(this).parent().children("#shop_mem_id").val();
						}
					} );
				}else{
					alert("������ ����ϼ̽��ϴ�.");
					return false;
				}
				
				$.ajax({
						url:'/deleteMember.soul',
						type:'post',
						data: param,
						dataType: 'text'
				});
				alert("���� �� �׸��� ���������� ���� �Ǿ����ϴ�.");
				location.reload(true);
			}
		} );
	});
</script>
</head>
<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="1200" align="center"><tr><td>
<img src="/images/item/member_list.gif"></td></tr></table>
<table width="1200" align="center"><tr><th width="156" height="33" align="left" valign="top">
<input type="checkbox" id="all" onclick="selectAll('chk[]','all');" style="margin-left: 25px"><font color="gray" size="2"> ��ü ����</font></th><th colspan="4" align="right" valign="middle">total: ${count }</th>
<tr>
<td height="23" align="center" valign="middle">����
</td><td width="240" align="center" valign="middle"><strong>���̵�</strong></td><td width="255" align="center" valign="middle"><strong>�̸�</strong></td><td width="262" align="center" valign="middle"><strong>����ó</strong></td><td width="263" align="center" valign="middle">�ּ�</td>
</tr>
<c:forEach var="member" items="${memberList}" varStatus="status">
<tr class="checkclass">
	<td height="29" align="center"><input type="checkbox"  id="chk" name="chk[]"><input type="hidden" id="shop_mem_id" value="${member.shop_mem_id}">${status.count }</td>
	<td align="center"><font size="3px">${member.shop_mem_id}</font></td>
	<td align="center"><font size="3px">${member.shop_mem_name}</font></td>
	<td align="center"><font size="3px">${member.shop_mem_phone}</font></td>
	<td align="center"><font size="3px">${member.shop_mem_addr1 }</font></td>
	</tr>	
</c:forEach>
<tr><td colspan="5"><hr color="2a83da" size="1"></td></tr>
<tr><td colspan="5" align="right">
	<p>
	  <input type="button" value="����" id="delete"/>
	  </p></td>
</tr>
</table>
</body>
</html>