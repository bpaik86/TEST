<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,soul.item.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<table width="1200"cellspacing="0" cellpadding="0" border="0" 
		align="center" >
<tr><td><img src="/images/item/${menu_images}"></td></tr></table>
<table width="1200" cellspacing="0" cellpadding="0" border="0" 
		align="center">
	<tr>
		<td valign="top">
		<!-- 상품 리스트 -->
		<table border="0">
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
									<dd><br>${list.ITEM_TITLE}</dd>
									<dd><br><b>${list.ITEM_PRICE}원</b></dd>
									<dd><br><font color="#999999">${list.ITEM_STITLE}</font></dd>
								</dl>
							</div>
							</td>
						<c:if test="${status.count%4==0 }"></tr></c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		<%-- <tr>	   
				<c:otherwise> 
				<c:forEach items="${result}" var="list">
				<td width="275" >
				<br>
			 	<a href="/item_view.soul?ITEM_ID=${list.ITEM_ID}">
			 	<img src="/resources/upload/${list.ITEM_MAIN}" 
			 		width="275" height="415" border="0"/>
			 	<br/>${list.ITEM_TITLE}</a>
				<br/><b>${list.ITEM_PRICE}원</b>
				<br>
				<font color="#999999">${list.ITEM_STITLE}</font>			
				<br>
				</td>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr> --%>
		</table>
		<!-- 상품 리스트 -->
		</td>
		</tr>
		<tr>
		
		</tr>
		</table>
		</td>
	</tr>
	</table>

</body>

</html>
