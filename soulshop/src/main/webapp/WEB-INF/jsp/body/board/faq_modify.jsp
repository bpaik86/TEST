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
					<th scope="">임시ID</th>
					<td><input type="text" id="SHOP_MEM_ID" name="SHOP_MEM_ID" class="view_text" value="${map.SHOP_MEM_ID }"></td>
			    </tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="FB_TITLE" name="FB_TITLE" class="wdp_90" value="${map.FB_TITLE }"/>
					</td>
				</tr>
				<tr>
					<th scope="row">종류</th>
					<td colspan="3">
						<input type="text" id="FB_BOARD_TP" name="FB_BOARD_TP" class="wdp_90" value="${map.FB_BOARD_TP }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FB_CONTENT" name="FB_CONTENT">${map.FB_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<br/>
	    <div class="wrapper" align="center">
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
 </div>
	    <br/><br/>
	
	
	
	<%@ include file="/WEB-INF/jsp/body/board/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});

		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/faq.soul' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/updateBoard2.soul' />");
			comSubmit.submit();
		}
		

	</script>
</body>
</html>