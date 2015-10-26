<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
.clsBannerScreen {overflow: hidden;position: relative;height:525px; width: 1910px; border:1px solid #e1e1e1; cursor:pointer; clear:both;}
.clsBannerScreen .images {position:absolute;}
ul, li {list-style:none; margin:0; padding:0; font-size:10pt; }
.clsBannerButton {width:1910px;cursor:pointer;border-bottom:1px solid #e1e1e1;}
.clsBannerButton li {width:360px;float:left;border-right:1px solid #e1e1e1;padding:2px;}
.clsBannerButton li.fir {border-left:1px solid #e1e1e1;}

.clsBannerButton li.labelOverClass {font-weight:bold;}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/main/jquery.banner.js"></script>
<script type="text/javascript">
<!--
$(function() {
	$("#image_list_2").jQBanner({nWidth:1910,nHeight:525,nCount:5,isActType:"left",nOrderNo:1,isStartAct:"N",isStartDelay:"Y",nDelay:2000,isBtnType:"li"});
	
});
//-->
</script>
<title></title>
<script></script>
</head>
<body>

<div id="image_list_2">
<div class="clsBannerScreen">
	<div class="images" style="display:block"><img src="/images/main/slid_1.jpg" /></div>
	<div class="images"><img src="/images/main/slid_2.jpg" /></div>
	<div class="images"><img src="/images/main/slid_3.jpg" /></div>
	<div class="images"><img src="/images/main/slid_4.jpg" /></div>
	<div class="images"><img src="/images/main/slid_5.jpg" /></div>
</div>
</div>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<table width="1200" cellspacing="0" cellpadding="0" border="0" 	align="center">
	<tr><td><img src="/images/item/new_arrival.gif" /></td></tr>
</table>

		<table width="1200" cellspacing="0" cellpadding="0" border="0" 		align="center">
		   <c:choose> 
				<c:when test="${requestScope.result[0]==null}">
					<tr>
					<td width="1200" height="300" align="center">
					등록된 글이 없습니다.
					</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="list" items="${result }" begin="0" varStatus="status" end="${result.size() }">
						<c:if test="${status.index%4==0 }"><tr></c:if>
							<td width="275" ><br>
							<div style="line-height:0.7em">
								<dl>
									<dd>
										<a href="/item_view.soul?ITEM_ID=${list.ITEM_ID}">
				 						<img src="/resources/upload/${list.ITEM_MAIN}" width="275" height="415" border="0"/>
									</dd>
									<dd><br>${list.ITEM_TITLE}</a></dd>
									<dd><br><b>${list.ITEM_PRICE}원</b></dd>
									<dd><br><font color="#999999">${list.ITEM_STITLE}</font></dd>
								</dl>
							</div>
							</td>
						<c:if test="${status.count%4==0 }"></tr></c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>	
		</table>
		
<%-- <c:choose>
    <c:when test="${not empty sessionScope.member}">
        <h2>로그인 성공 </h2>
        이름 : ${sessionScope.member.shop_mem_name}
 
        이메일 : <c:out value="${sessionScope.member.shop_mem_email}"/> 
        <a href="/logout.soul">로그아웃</a>
       
    </c:when>
</c:choose> --%>
</body>
</html>