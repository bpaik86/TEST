<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/body/board/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
		<table class="board_view" align="center">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="QB_TITLE" name="QB_TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="">임시ID</th>
					<td><input type="text" id="SHOP_MEM_ID" name="SHOP_MEM_ID" class="view_text"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="QB_CONTENT" name="QB_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br/>
	    <div class="wrapper" align="center">
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	    </div>
	    <br/><br/>
	
	
	</form>
	
	<%@ include file="/WEB-INF/jsp/body/board/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna.soul' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/insertBoard.soul' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>