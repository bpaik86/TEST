<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>
</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

$(document).ready(function() {
	$('#buy').on("click",function(){
		
		var test=$('input[name=session]').val();
		var item_op1=$('select[name=item_op1]').val();
		var item_op2=$('select[name=item_op2]').val();
		if(test==""){
			var gologin=confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니가?");
			if(gologin==true){
				location.href("/login.soul");
				return false;
			}else{
				return false;
			}
		}
		
		if(item_op1==""){
			alert("사이즈를 선택해주세요");
			return false;
		}
		if(item_op2==""){
			alert("색상을 선택해주세요");
			return false;
		}
	});
	$("#basket").on("click",function(){
	
		
		var test=$('input[name=session]').val();
		if(test==""){
			var gologin=confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니가?");
			if(gologin==true){
				location.href("/login.soul");
				return false;
			}else{
				return false;
			}
		}
	
		var item_id=$('input[name=item_id]').val();
		alert(item_id)
		var item_name=$('input[name=item_name]').val();
		
		var item_count=$('input[name=item_count]').val();
		var item_op1=$('select[name=item_op1]').val();
		var item_op2=$('select[name=item_op2]').val();
		var item_price=$('input[name=item_price]').val();
		
		if(item_op1==""){
			alert("사이즈를 선택해주세요");
			return false;
		}
		if(item_op2==""){
			alert("색상을 선택해주세요");
			return false;
		}
		var param="item_id="+item_id+"&item_name="+item_name+"&item_count="+item_count+"&item_op1="+item_op1+"&item_op2="+item_op2+"&item_price="+item_price;
		
		$.ajax({
			url:'/AddBasket.soul',
			type:'post',
			data:param,
			dataType:'text'
		});
		
		var go=	confirm("장바구니 페이지로 이동하여 확인하시겠습니까?");
		
		if(go==true){
			location.href("/basket.soul");
		}else{
			location.reload(true);
		}
		
	});
});
/* function isBuy(goodsform) {
	if (document.goodsform.size.value=="") {
		alert("사이즈를 선택해주세요.")
		return;
	} else if (document.goodsform.color.value=="") {
		alert("색상을 선택해주세요.")
		return;
	}

	var amount=document.goodsform.amount.value;
	var size=document.goodsform.size.value;;
	var type=document.goodsform.color.value;;
	
	var isbuy=confirm("구매하시겠습니까?");
	if(isbuy==true) {
		goodsform.action="OrderStart.or";
		goodsform.submit();
	} else {
		return;
	}
}

function isBasket(basketform) {
	if (document.goodsform.size.value=="") {
		alert("사이즈를 선택해주세요.")
		return;
	} else if (document.goodsform.color.value=="") {
		alert("색상을 선택해주세요.")
		return;
	}
	
	var amount=document.goodsform.amount.value;
	var size=document.goodsform.size.value;;
	var type=document.goodsform.color.value;;
	
	var isbuy=confirm("장바구니에 저장하시겠습니까?");
	
	if(isbuy==true) {
		basketform.action="BasketAdd.ba";
		basketform.submit();
	} else {
		return;
	}
}
 */
function count_change(temp){
	var test=document.goodsform.item_count.value;
	if(temp==0){
		test++;
	}else if(temp==1){
		if(test> 1) test--;
	}
	
	document.goodsform.item_count.value=test;
}
</script>
<script type="text/javascript"></script>
</head>
<body>
<table width="1400" cellspacing="0" cellpadding="0" border="0"
	align="center">
	<tr>
	<td colspan=2 align=center><!-- 상품 주문 내용 -->
		<form name="goodsform" width="1400" action="order.soul" method="post">
			<p>
			  <input type="hidden" name="item_name" value="${result.ITEM_TITLE}">
			  <input type="hidden" name="item_price" value="${result.ITEM_PRICE}">
			  <input type="hidden" name="item_id" value="${result.ITEM_ID }"/>
			  <input type="hidden" name="item_img" value="${result.ITEM_MAIN }" />
			  <input type="hidden" name="session" value="${sessionScope.member.shop_mem_name}">
  <%-- 		<input type="hidden" name="goodsnum" 
			value="${itemArray.GOODS_NUM }">
		<input type="hidden" name="item"
			value="<%=request.getParameter("item") %>"> 
		<input type="hidden" name="gr_goods_num"
			value="<%=request.getParameter("gr_goods_num") %>">
		<input type="hidden" name="isitem"
			value="<%=request.getParameter("isitem") %>">
		<input type="hidden" name="order" value="goods">
		<input type="hidden" name="price" 
			value="<%=itemArray.getGOODS_PRICE() %>">
		<input type="hidden" name="goodsname" 
			value="<%=itemArray.getGOODS_NAME() %>"> 
		<input type="hidden" name="goodsimage"
			value="${fn:trim(mainImage)}"> --%>
		  </p>
			<p>&nbsp;</p>
			<p><img  src="/images/item/item_view.gif"></p>
			<p>&nbsp; </p>
		  <table width="600" border="0" align="center">
		<tr>
			<td width="303" height="223" align="center" valign="middle">
				
				<img src="${list[0].FILENAME}"/>
			</td>
			<td width="381" align="center" valign="middle">
			<table width="300" height="200" border="0" align="right">
				<tr>
					<td colspan="4" align="left" height="50">
						<h2><b>${result.ITEM_TITLE}</b></h2>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="left" height="30">
						<font color="#999999">${result.ITEM_STITLE}</font>
					</td>
				</tr>
				<tr>
					<td align="left">판매가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
					<td colspan="3">${result.ITEM_PRICE} 원</td>
				</tr>
				<tr>
					<td rowspan="2" align="left">수량
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;:
					</td>
					<td width="58" rowspan="2">
						<input name="item_count" type="text" 
							style="text-align: right"
							value="1"	size="4" />
					</td>
					<td valign="bottom">
						<div align="center">
							<a href="JavaScript:count_change(0)">▲</a>
						</div>
					</td>
					<td width="69" rowspan="2" align="left">개</td>
				</tr>
				<tr>
					<td valign="top">
						<div align="center">
							<a href="JavaScript:count_change(1)">▼</a>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" height="30" 
						valign="middle">
						남은수량(${result.ITEM_AMT})개
					</td>
				</tr>
				<tr>
					<td colspan="4" align="left">옵션1&nbsp;&nbsp;&nbsp;&nbsp; 
						<select name="item_op1" size="1">
							<option value="">크기를 선택하세요</option>
							<option value="">-----------------</option>

							<c:forTokens var="size" 
							items="${result.ITEM_OP1}"	delims=",">
								<option value="${fn:trim(size)}" >
									${fn:trim(size)}
								</option>
							</c:forTokens>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="left">옵션2&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="item_op2" size="1">
							<option value="">색깔을 선택하세요</option>
							<option value="">-----------------</option>
							<c:forTokens var="color" 
								items="${result.ITEM_OP2}"
								delims=",">
								<option value="${fn:trim(color)}">
									${fn:trim(color)}
								</option>
							</c:forTokens>
						</select>
					</td>
				</tr>
				<tr>
					<td height="50" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
						<!-- <a href="javascript:isBuy(goodsform);" id="buy">
						[구매하기]
						</a>  -->
						<input type="submit" value="구매하기" id="buy">
						<input type="button" value="장바구니" id="basket">
					</td>
				</tr>
			</table>
		</td>
		</tr>
		</table>
		  <p><img  src="/images/item/item_detail.gif" alt=""></p>
		</form>
		<!-- 상품 내용 -->
     	<br><br>
		<table width="1400" height="1000" align="enter">
			<tr>
				<td align="center">
				<img src="${list[1].FILENAME}"><br>
				<img src="${list[2].FILENAME}"><br>
				<img src="${list[3].FILENAME}"><br>
				
				</td>
			</tr>
		</table>
		<br><br>
		<table width="200" border="0" align="center">
			<tr align="left">
				<td colspan="3"><c:forEach var="itemimg"
					items="${requestScope.contentImage}">
					<img src="./upload/${fn:trim(itemimg)}" />
				</c:forEach></td>
			</tr>
		</table>
</body>
</html>