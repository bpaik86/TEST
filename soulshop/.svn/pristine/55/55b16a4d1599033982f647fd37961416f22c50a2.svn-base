<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table align="center" class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
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
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
					<strong>
<textarea text-align="left" rows="20"cols="100" title="내용" id="CONTENTS" name="CONTENTS"
> 

 &nbsp;★키:
  ★몸무게:
  ★사이즈:
  ★후기:						
							
						
							
						</textarea></strong></td>
				</tr>
			</tbody>
		</table>
		<div  align="center" >
			<p>
				<input type="file" id="file" name="file_0"> <a href="#this"
					class="photo_btn" id="delete" name="delete">삭제</a>
			</p>
			<p><a	href="#this" class="photo_btn" id="write">작성하기</a> <a href="#this"
			class="photo_btn" id="list">목록으로</a></p>
		</div>

		<br />
		<br />
	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = 1;

		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_phoopenBoardList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_phoinsertBoard();
			});

			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_phoaddFile();
			});

			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_phodeleteFile($(this));
			});
		});

		function fn_phoopenBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='photozone.soul' />");
			comSubmit.submit();
		}

		function fn_phoinsertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='insert.soul' />");
			comSubmit.submit();
		}

		function fn_phoaddFile() {
			var str = "<p><input type='file' name='file_"
					+ (gfv_count++)
					+ "'><a href='#this' class='photo_btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_phodeleteFile($(this));
			});
		}

		function fn_phodeleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>