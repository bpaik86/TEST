<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  



<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/css/photo/ui.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/js/photo/common.js" charset="utf-8"></script>
</head>

<body>
	<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p></p>
    <table width="1200" align="center">
    <tr>
    <td align="center">
    <img width="300" src="/images/title/photoz.PNG"><br/></td></tr>
    <td align="right">
    	<p>&nbsp</p>
		<a href="#this" class="photo_btn" id="write" ><b>글 쓰기</b></a></td>
	</table>
	<span style="line-height: 20%"><br></span>
	<table width="1200" align="center" class="board_list">
	
	<thead>
		<tr>
				<th scope="col"></th>
				<th align="center" valign="middle" scope="col">이미지</th>
				<th align="center" valign="middle" scope="col">제목</th>
				<th align="center" valign="middle" scope="col">조회수</th>
				<th align="center" valign="middle" scope="col">작성일</th>
			</tr>
	</thead>	
	<tbody text-align="center">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<tr>
							<td width="30"></td>
							<td width="100" text-align="center" class="title" >
							<a href="#this" name="title" text-align="center">
							<img width="150" height="180" src="${row.STORED_FILE_NAME}">
							</a>
								<input type="hidden" id="IDX" value="${row.IDX}">
						
							</td>
					
							<td width="600" text-align="center" class="title" >
								<a href="#this" name="title" text-align="center"><strong>${row.TITLE }</strong></a>
								
								<input type="hidden" id="IDX" value="${row.IDX}">
								<BR><BR><BR>
								${row.CONTENTS}
							</td>
							<td width="100">${row.HIT_CNT }</td>
							<td width="100">${row.CREA_DTM }</td>
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
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_phoopenBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_phoopenBoardDetail($(this));
			});
		});
		
		
		function fn_phoopenBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='photo_insert.soul' />");
			comSubmit.submit();
		}
		
		function fn_phoopenBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='photo_view.soul' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
	</script>	

</body>

</html>