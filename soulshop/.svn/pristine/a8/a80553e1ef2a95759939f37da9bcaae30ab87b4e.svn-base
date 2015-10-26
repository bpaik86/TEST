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
				<td>${map.QB_IMG_NO }
				<input type="hidden" id="QB_IMG_NO" name="QB_IMG_NO" value="${map.QB_IMG_NO }">
				</td>
			</tr>
			<tr>
				<th scope="row">회원ID</th>
				<td>${map.SHOP_MEM_ID }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.QB_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.QB_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<div class="wrapper" align="center">
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
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
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
		
 			$("#reply").on("click", function(e){ //답변하기 버튼
				e.preventDefault();
				fn_openBoardReply();
			}); 
		
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			
			
		}); 
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna.soul' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var QB_IMG_NO = "${map.QB_IMG_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna_modify.soul' />");
			comSubmit.addParam("QB_IMG_NO", QB_IMG_NO);
			comSubmit.submit();
		}
		
		
  		function fn_openBoardReply(){
			var QB_IMG_NO = "${map.QB_IMG_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qna_reply.soul' />");
			comSubmit.addParam("QB_IMG_NO", QB_IMG_NO);
			comSubmit.submit(); 
		}  
		
  		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deleteBoard.soul' />");
			comSubmit.addParam("QB_IMG_NO", $("#QB_IMG_NO").val());
			comSubmit.submit();
				
		}
			
			
 		
	</script>
</body>
</html>