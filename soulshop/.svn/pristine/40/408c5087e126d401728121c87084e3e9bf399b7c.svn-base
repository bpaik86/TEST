<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*,soul.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/body/board/include/include-header.jspf" %>
</head>
<body>

	<h2 align="center">FAQ게시판</h2>
	<table class="board_list" align="center">
		<colgroup>
			<col width="10%"/>
			<col width="45%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="15%"/>
		</colgroup>
		<thead>	
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">게시판 종류</th>
				<th scope="col">회원 ID</th>
			    <th scope="col">조회수</th>
			    <th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.FB_ARTICLE_NO }</td>
							<td class="title">
								<a href="#this" name="title">${row.FB_TITLE }</a>
								<input type="hidden" id="FB_ARTICLE_NO" value="${row.FB_ARTICLE_NO }">
							</td>
							<td>${row.FB_BOARD_TP }</td>
							<td>${row.SHOP_MEM_ID }</td>
							<td>${row.FB_READCOUNT }</td>
							<td>${row.FB_DT }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
<div align="center">
	      	<td colspan="5" align="center">${pagingHtml2 }</td>
</div>
	
	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>
	
	<%@ include file="/WEB-INF/jsp/body/board/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq_insert.soul' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq_view.soul' />");
			comSubmit.addParam("FB_ARTICLE_NO", obj.parent().find("#FB_ARTICLE_NO").val());
			comSubmit.submit();
		}
	</script>	
</body>
</html>