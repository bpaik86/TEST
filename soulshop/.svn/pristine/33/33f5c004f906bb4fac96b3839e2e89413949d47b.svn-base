<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/body/board/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
		<table class="board_view" align="center">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 답변</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.QB_IMG_NO }
						<input type="hidden" id="QB_IMG_NO" name="QB_IMG_NO" value="${map.QB_IMG_NO }">
						<input type="hidden" id="STEP" name="STEP" value="${map.STEP} ">
						<input type="hidden" id="DEPTH" name="DEPTH" value="${map.DEPTH}">
						<input type="hidden" id="REF" name="REF" value="${map.REF}">
					</td>
				</tr>
				<tr>
					<th scope="">임시ID</th>
					<td><input type="text" id="SHOP_MEM_ID" name="SHOP_MEM_ID" class="view_text"></td>
			    </tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="QB_TITLE" name="QB_TITLE" class="wdp_90" value="${map.QB_TITLE }"/> 
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="QB_CONTENT" name="QB_CONTENT">${map.QB_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<br/>
	<div class="wrapper" align="center">
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="reply">답변하기</a>
	</div>
	<br/><br/>
	
	
	<%@ include file="/WEB-INF/jsp/body/board/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#reply").on("click", function(e){ //답변하기 버튼
				e.preventDefault();
				fn_replyBoard();
			});
			
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna.soul' />");
			comSubmit.submit();
		}
		
		function fn_replyBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/replyBoard.soul' />");
			comSubmit.submit();
		}
		
		
		
		
		
	</script>
</body>
</html>