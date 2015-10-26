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
	$(function() {
		$('input[type=submit]').on('click',function(){
			
		});
	});
	$(document).ready(function() {
		
		$('#delete').on('click',function(){
			var sum=$('#changeprice').children('span').text();
			alert(sum);
			if($('.tbody :checked').size()<1){
				alert("제품을 선택하고 삭제를 시도하세요..");
				return false;
			}else{
				$('.tbody :checked').each(function(){
					 $(this).parent().parent().remove();
					 sum=sum-$(this).val();
				});
			}
			$('#changeprice').children('span').text(sum);
			$('#changeprice1').children('span').text(sum);
			
			
			
		});
		$('#pay').on('click',function(){
			
			var sum=$('#changeprice').children('span').text();
			var name=$('input[name=shop_mem_name_name]');
			var addr=$('input[name=shop_mem_addr1]');
			var phone=$('input[name=shop_mem_phone]');
			var email=$('input[name=shop_mem_email]');
			if(name.val()==""){
				alert("주문자 성명을 입력해주세요");
				return false;
			}
			if(addr.val()==""){
				alert("주소를 입력해주세요");
				return false;
			}
			if(phone.val()==""){
				alert("연락 받을실 연락처를 입력해주세요");
				return false;
			}
			if(email.val()==""){
				alert("email 을 입력해주세요");
				return false;
			}
			
			$('input[name=pay_price]').attr('value',sum);
			/* alert($('#changeprice1').children('span').text());
			window.open("main.soul",
					"confirm",
					"toolbar=no, location=no, status=co, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
			 */
		});
		
		
		$('input[name=radio]').on("click",function(){
			var yes= $("input:radio[name=radio]:checked").val();
			var name=$('input[name=receiver_name]');
			var addr=$('input[name=receiver_addr]');
			var phone=$('input[name=receiver_phone]');
			var email=$('input[name=receiver_email]');
			
			if(yes=='yes'){
				name.attr('value','${member.shop_mem_name }');
				addr.attr('value','${member.shop_mem_addr1 }');
				phone.attr('value','${member.shop_mem_phone }');
				email.attr('value','${member.shop_mem_email }');
			}else if(yes=='no'){
				name.attr('value',' ');
				addr.attr('value',' ');
				phone.attr('value',' ');
				email.attr('value',' ');
			}
		});
	});
</script>
</head>
<body>
<table width="1200" align="center">
<tr><td><p>&nbsp;</p>
  <p><img src="/images/item/item_info.gif"></p>
</table>
<div class="divclass">
<form action="pay.soul" method="post">
	<table width="1200" align="center">
		<thead>
			<tr >
				<th width="500" align="center">상품명</th><th>상품가격</th><th>수량</th><th>선택</th>
			</tr>
		</thead>
		<tbody class="tbody">
		<c:forEach var="order" items="${orderList}">
			<tr id="list">
				<td  align="center"><img src="${order.item_img }" width="50px" height="50px"> ${order.item_name }<input type="hidden" name="item_name" value="${order.item_name }" /></td>
				<td align="center" valign="middle">	${order.item_price }<input type="hidden" name="item_id" value="${order.item_id }" /></td>
			  <td align="center" valign="middle">	${order.item_count }<input type="hidden" name="item_count" value="${order.item_count }" /></td>
			  <td align="center" valign="middle">	<input type="checkbox" name="chk" value="${order.total_price }"><input type="hidden" name="total_price" value="${order.total_price }" /></td>
			</tr>
		</c:forEach>
			<tr>
						<td colspan="4" align="right" id="changeprice"><hr size="1" color="2bd8d6">
					    <p>[총 결제 금액]:<span><strong>${total_price }</strong></span></p></td>
			</tr>
			<tr>
				<td height="27" colspan="4" align="right" valign="middle"><input type="button" id="delete" value="선택 삭제하기" /></td>
			</tr>
		</tbody>
	</table>
	<p>&nbsp;</p>
	<table width="1200" align="center">
<tr><td><p>&nbsp;</p>
  <p><img src="/images/item/user_info.gif"></p>
</table>
    <table width="1200px" align="center">
    <tr>
      <td>
	<table width="298" height="143" border="0" cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor="#FFF4F4"><strong>성명</strong></td><td>${member.shop_mem_name }</td>
	  </tr>
		<tr>
			<td bgcolor="#FFF4F4"><strong>주소</strong></td><td>${member.shop_mem_addr1}</td>
		</tr>
		<tr>
			<td bgcolor="#FFF4F4"><strong>전화번호</strong></td><td>${member.shop_mem_phone }</td>
		</tr>
		<tr>
			<td bgcolor="#FFF4F4"><strong>E-MAIL</strong></td><td>${member.shop_mem_email }</td>
		</tr>
	</table></td></tr>
    </table>
	<br><br><br>
	
	<table width="1200" align="center">
    <tr><td><img src="/images/item/deil_info.gif"></td></tr>
	<tr><td width="320" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;배송지 정보가 주문자 정보와 동일합니까? <input type="radio" name="radio" value="yes"> 예 &nbsp;&nbsp;<input type="radio" name="radio" value="no" checked="checked">아니오</strong></td></tr>
	<tr>
	  <td><table width="320" height="132">
		<tr>
			<td>성명</td><td><input type="text" name="receiver_name"/></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="receiver_addr"/></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="receiver_phone"/></td>
		</tr>
		<tr>
			<td>E-MAIL</td><td><input type="text" name="receiver_email" /></td>
		</tr>
	<table width="1200" align="center">
<tr><td><p>&nbsp;</p>
  <p><img src="/images/item/pay_info.gif"></p>
</table>
		<tr>
			<td colspan="2" id="changeprice1">[총 결제 금액]: <span><strong>${total_price }</strong></span></td>
		</tr>
	</table></td></tr> </table>
	
    <table width="1200" align="center"><tr><td align="right">
    <input type="hidden" name="pay_price" value=""/>
	<input type="image" id="pay" src="/images/item/pay_btn.gif"/></td></tr></table>
</form>
</div>
</body>
</html>