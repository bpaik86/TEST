<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<table align="center" class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<img width="300" src="/images/title/photoz.PNG">
<br>
			<br>
			<br>
			<br>
			</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }</td>
			</tr>
			<tr>
		
				<td>
				
				</td>
					<td>${map.CONTENTS }<br><br><c:forEach var="row" items="${list }"><img width="600" height="700" src="${row.STORED_FILE_NAME}">
				
				</c:forEach>
				</td>
				</tr>
			<tr>
			
			</tr>
		</tbody>
	</table>
	<br/>
	
	<div align="center">
	<a href="#this" class="photo_btn" id="list">목록으로</a>
	<a href="#this" class="photo_btn" id="update">삭제하기</a>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_phoopenBoardList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_phoopenBoardUpdate();
			});
			
			$("a[name='file']").on("click", function(e){ //파일 이름
				e.preventDefault();
				fn_phodownloadFile($(this));
			});
		});
		
		function fn_phoopenBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='photozone.soul' />");
			comSubmit.submit();
		}
		
		function fn_phoopenBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='photo_modify.soul' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_phodownloadFile(obj){
			var idx = obj.parent().find("#IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='imgdown.soul' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>