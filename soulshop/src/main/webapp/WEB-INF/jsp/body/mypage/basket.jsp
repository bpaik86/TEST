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
	/* function selectall(obj1,obj2){
		var chk=document.getElementsByName(obj1);
		var chkall=document.getElementById(obj2);
		if(chkall.checked==true){
			alert("2");
			for(i=0;i<chk.length;i++){
				basket_no[i].checked=true;
			}
		}else{
			for(i=0;i<chk.length;i++){
				basket_no[i].checked=false;
			}
		}
	} */
	$(document).ready(function() {
		
		 $("#checkall").click(function(){
		        //Ŭ���Ǿ�����
		        if($("#checkall").prop("checked")){
		            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
		            $("input[name=basket_no]").prop("checked",true);
		            //Ŭ���� �ȵ�������
		        }else{
		            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
		            $("input[name=basket_no]").prop("checked",false);
		        }
		    })
		
		
		$("#delete").on("click",function(){
			if($(".checkclass :checked").size()<1){
				alert("�ϳ� �̻��� �������� üũ�� ���� �õ��� ���ּ���!!");
				return false;
			}else{
				var param=""
				$(".checkclass :checked").each(function() {
					if(param==""){
						param="basket_no="+$(this).parent().children("#basket_no").val();
					}else{
						param= param+"&basket_no="+$(this).parent().children("#basket_no").val();
					}
				});
				
				$.ajax({
					url: '/deleteBasketItem.soul',
					type: 'post',
					data: param,
					dataType: 'text'
				});
				alert("�����Ͻ� ��ǰ���� ���������� ���� �Ǿ����ϴ�.");
				location.reload(true);
			}
		});
		
	 	$("#order").on("click",function(){
			if($(".checkclass :checked").size()<1){
				alert("�Ѱ� �̻��� ��ǰ�� �����Ͻð� �ٽ� �õ����ּ���..");
				return false;
			}/* else{
				var param="";
				$(".checkclass :checked").each(function() {
					if(param=""){
						param="basket_no="+$(this).parent().children("#basket_no").val();
					}else{
						param= param+"&basket_no="+$(this).parent().children("#basket_no").val();
					}
				});
				$.ajax({
					url: '/order.soul',
					type: 'post',
					data: param,
					dataType: 'text'
				});
				
			} */
		}); 
	});
</script>
</head>
<body>
<form action="order.soul" method="post">
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td align="center"><p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="/images/item/cart.gif"></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p></td></tr></table>
<table width="1200" border="1" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="150" height="34" align="center" valign="middle" bgcolor="#e6f3f9"><input type="checkbox" id="checkall"></th>
    <th width="250" align="center" valign="middle" bgcolor="#e6f3f9"><h3>��ǰ��</h3></th>
    <th width="190" align="center" valign="middle" bgcolor="#e6f3f9"><h3>�ɼ�1</h3></th>
    <th width="210" align="center" valign="middle" bgcolor="#e6f3f9"><h3>�ɼ�2</h3></th>
    <th width="210" align="center" valign="middle" bgcolor="#e6f3f9"><h3>����</h3></th>
    <th width="211" align="center" valign="middle" bgcolor="#e6f3f9"><h3>����ݾ�</h3></th>
  </tr> 
  <c:choose>
  	<c:when test="${basketList[0]==null}">
		<tr>
			<td colspan="6" height="200" align="center">
			<img src="/images/item/basket_empty.jpg"><br>��ٱ��ϰ�  ����ֽ��ϴ�.
			</td>
		</tr>
	</c:when>
	<c:otherwise>
<c:forEach var="basket" items="${basketList}">		
  <tr class="checkclass">
    <td height="35" align="center" valign="middle">
      <div style="float: left; margin-left: 20px"><input type="checkbox" id="basket_no"  name="basket_no" value="${basket.basket_no}"></div>
    </td>
    <td align="center" valign="middle"><div style="float: left; width: 200px;margin-left: 10px;text-align: center;font-size: 3px;"><a href="/list_view.soul?ITEM_ID=${basket.item_id }"><font size="3px">${basket.item_name}</font></a></div></td>
    <td align="center" valign="middle"><div style="float: left; width: 200px;margin-left: 10px;text-align: center;font-size: 3px;"><font size="3px">${basket.item_op1 }</font></div></td>
    <td align="center" valign="middle"><div style="float: left; width: 200px;margin-left: 10px;text-align: center;font-size: 3px;"><font size="3px">${basket.item_op2 }</font></div></td>
    <td align="center" valign="middle"><div style="float: left; width: 200px;margin-left: 10px;text-align: center;font-size: 3px;"><font size="3px">${basket.item_count }</font></div></td>
    <td align="center" valign="middle"><div style="font-size: 3px;"><font size="3px">${basket.item_price }</font></div></td>
  </tr>
</c:forEach>
</c:otherwise>
			</c:choose>
	
</table>
<table width="1200" align="center"><tr><td align="right" valign="middle"><input type="button" value="����" id="delete"/>
	<input type="submit" value="�ֹ��ϱ�" id="order" />
</td></tr></table>

</form>
</body>
</html>