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
	 $(document).ready(function() {
		  var status=$('input[name=original]').val();
		 
		  if(status=="배송전"){
			  $('option[value=배송전]').attr('selected','selected');
		  }else{
			  if(status=="배송중"){
				  $('option[value=배송중]').attr('selected','selected');
			  }else if(status=="배송완료"){
				  $('option[value=배송완료]').attr('selected','selected');
			  } else{
				  $('option[value=배송전]').attr('selected','selected');
			  }
		  }
		  $('#before').on('click',function(){
				 
				if($(".tbody :checked").size()<1){
					alert("하나 이상의 항목을 선택하고 시도해주세요!");
					return false;
				}else{
					var param="";
					$(".tbody :checked").each(function(){
						if(param==""){
							param="order_no="+$(this).parent().children('input[name=order_no]').val();
						}else{
							param=param+"&order_no="+$(this).parent().children('input[name=order_no]').val();
						}
					});
					param=param+"&change=배송전"+"&original="+$('select[name=status]').val();
					/* alert(param); */
				}
				 
			
				$.ajax({
					url:'/change.soul',
					type:"post",
					data:param,
					dataType:"text"
					
				}); 
				alert("정상적으로 변환 되었습니다.");
				 $('#selectForm').submit();
					
			}); 
		  
		  $('#ing').on('click',function(){
				 
				if($(".tbody :checked").size()<1){
					alert("하나 이상의 항목을 선택하고 시도해주세요!");
					return false;
				}else{
					var param="";
					$(".tbody :checked").each(function(){
						if(param==""){
							param="order_no="+$(this).parent().children('input[name=order_no]').val();
						}else{
							param=param+"&order_no="+$(this).parent().children('input[name=order_no]').val();
						}
					});
					param=param+"&change=배송중"+"&original="+$('select[name=status]').val();
					/* alert(param); */
				}
				 
			
				$.ajax({
					url:'/change.soul',
					type:"post",
					data:param,
					dataType:"text"
				});
				alert("정상적으로 변환 되었습니다.");
				 $('#selectForm').submit();
				
			}); 
		  
		  
		  $('#end').on('click',function(){
				 
				if($(".tbody :checked").size()<1){
					alert("하나 이상의 항목을 선택하고 시도해주세요!");
					return false;
				}else{
					var param="";
					$(".tbody :checked").each(function(){
						if(param==""){
							param="order_no="+$(this).parent().children('input[name=order_no]').val();
						}else{
							param=param+"&order_no="+$(this).parent().children('input[name=order_no]').val();
						}
					});
					param=param+"&change=배송완료"+"&original="+$('select[name=status]').val();
					/* alert(param); */
				}
				 
			
				$.ajax({
					url:'/change.soul',
					type:"post",
					data:param,
					dataType:"text"
				});
				alert("정상적으로 변환 되었습니다.");
				 $('#selectForm').submit();
				
			}); 
		
	}); 
</script>
</head>
<body>
<table width="1200" align="center"><tr><td>
<img src="/images/item/deliver_list.gif"></td></tr></table>
<form action="/delivery_management.soul" method="post" id="selectForm">
	<table width="1200" align="center"><tr><td>불러오기 : <input type="hidden" name="original" value="${status }">
		<select name="status" id="select"><option value="배송전">배송전</option><option value="배송중">배송중</option><option value="배송완료">배송완료</option></select>
		<input type="submit" value="확인"></td></tr></table>
</form>
<table  width="1200" cellspacing="1" cellpadding="1" border="1" align="center">
		<thead>
			<tr >
				<th width="" align="center">주문번호</th><th>상품명</th><th>주문날짜</th><th>수량</th><th>가격</th><th>받는 분</th><th>주소</th><th>연락처</th><th>배송상태</th><th>체크</th>
			</tr>
		</thead>
		<tbody class="tbody">
		
		<c:forEach var="order" items="${orderList}">
			<tr>
				<td  align="center"> ${order.order_no }</td>
				<td>	<a href="/item_view.soul?ITEM_ID=${order.item_id}">${order.item_name }</a></td>
				<td>	${order.date }</td>
				<td>${order.item_count }	</td>
				<td>${order.total_price}</td>
				<td>	${order.receiver_name}</td>
				<td>${ order.receiver_addr}</td>
				<td>${order.receiver_phone}</td>
				<td>${order.status}</td>
				<td><input type="checkbox" name="order_no" value="${order.order_no }" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table width="1200" align="center"><tr><td>
		<c:choose>
			<c:when test="${status=='배송전' }">		
				<input type="button" id="ing" value="배송중으로 변환"> 
				<input type="button" id="end" value="배송완료로 변환">		
			</c:when>
			<c:when test="${status=='배송중' }">	
				<input type="button" id="before" value="배송전으로 변환"> 
				<input type="button" id="end" value="배송완료로 변환">
			</c:when>
			<c:otherwise>		
				<input type="button" id="before" value="배송전으로 변환"> 
				<input type="button" id="ing" value="배송중으로 변환">			
			</c:otherwise>
		</c:choose>
</td></tr></table>
</body>
</html>