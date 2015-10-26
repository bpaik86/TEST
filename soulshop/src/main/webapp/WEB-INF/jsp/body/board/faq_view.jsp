<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/body/board/include/include-header.jspf" %>
</head>
<body>
	<table class="board_view" align="center">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>
				   ${map.FB_ARTICLE_NO }
				   <input type="hidden" id="FB_ARTICLE_NO" name="FB_ARTICLE_NO" value="${map.FB_ARTICLE_NO }">
				</td>
			</tr>
			<tr>
				<th scope="row">회원ID</th>
				<td>${map.SHOP_MEM_ID }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.FB_TITLE }</td>
			</tr>
			
			<tr>
				<th scope="row">종류</th>
				<td colspan="3">${map.FB_BOARD_TP }</td>
			</tr>

			<tr>
				<td colspan="4">${map.FB_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	
	<br/>
	    <div class="wrapper" align="center">
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	 </div>
	    <br/><br/>
	
	
	
	<%@ include file="/WEB-INF/jsp/body/board/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
		
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq.soul' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var FB_ARTICLE_NO = "${map.FB_ARTICLE_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq_modify.soul' />");
			comSubmit.addParam("FB_ARTICLE_NO", FB_ARTICLE_NO);
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deleteBoard2.soul' />");
			comSubmit.addParam("FB_ARTICLE_NO", $("#FB_ARTICLE_NO").val());
			comSubmit.submit();
			
		}
		
	</script>
</body>
</html>