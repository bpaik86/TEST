<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function selectall(obj,obj2){
	
	var chk=document.getElementsByName(obj);
	var chkall=document.getElementById(obj2);
	
	if(chkall.checked==true){
		
		for(i=0;i<chk.length;i++){	
			chk[i].checked=true;
		}
	}else{
		for(i=0;i<chk.length;i++){	
			chk[i].checked=false;
		}
	}
}
$(document).ready(function() {
	$("#delete").on("click",function(){
		if($(".checkclass :checked").size()<1){
			alert("�ϳ� �̻��� üũ �� ������ư�� �����ּ���. ");
			return false;
		}else{
			var param="";
			$(".checkclass :checked").each(function() {
				if(param==""){
					param="shop_mem_id="+$(this).parent().children("#shop_mem_id").val();
					
				}else{
					param=param+"&shop_mem_id="+$(this).parent().children("#shop_mem_id").val();
				}
			});
			
			$.ajax({
				url : '/member_delete_test.soul',
				type: 'post',
				data: param,
				dataType: 'text'
			});
			alert("���������� ���� �Ǿ����ϴ�.");//����°ʹ� ���ε尡 ���� ȭ�� ������ �ȵǴ°� �˸�â���� �������� �ذ�
			location.reload(true); 
			
		}
	});
});
</script>
</head>
<body>
<input type="checkbox" id="all" onclick="selectall('chk[]','all');"> ��ü ����
<div class="checkclass">
<c:forEach var="member" items="${memberList}" varStatus="status">
	<div>
	<input type="checkbox"  id="chk" name="chk[]">
	${status.count }
	${member.shop_mem_id}
	${member.shop_mem_name}
	${member.shop_mem_phone}
	
	<input type="hidden" id="shop_mem_id" value="${member.shop_mem_id}">
	
	</div>
</c:forEach>
</div>
	<input type="button" value="����" id="delete"/>
</body>
</html>