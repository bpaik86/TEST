<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<!-- <link href="/css/test/test.css" rel="stylesheet"> -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
	function selectall(obj,obj2){
		var chk=document.getElementsByName(obj);
		var chkall=document.getElementById(obj2);
		if(chkall.checked==true){
			for(i=0;i<chk.length;i++){	
				chk[i].checked=true;
			}
		}else{
			for(i=0;i<chk.length;i++){	
				chk[i].checked=false;
			}
		}
	}
	$(document).ready(function() {
		$("#delete").on("click",function(){
			if($(".checkclass :checked").size()<1){
				alert("하나 이상을 체크 후 삭제버튼을 눌러주세요. ");
				 location.reload(true);
				return false;
			}else{
				var param="";
				$(".checkclass :checked").each(function() {
					if(param==""){
						param="item_name="+$(this).parent().children("#item_name").val();
						
					}else{
						param=param+"&item_name="+$(this).parent().children("#item_name").val();
					}
				});
				
				$.ajax({
					url : '/checkBoxDelect_test.soul',
					type: 'post',
					data: param,
					dataType: 'text'
				});
				alert("정상적으로 삭제 되었습니다.");//지우는것다 리로드가 빨라서 화면 갱신이 안되는거 알림창으로 지연시켜 해결
				location.reload(true); 
				/* location.href("이동할 주소" */   
			}
		});
	});
</script>
</head>
<body>
	<%-- <td> Golf :<form:checkbox path="test" value="golf"/></td> --%>
<div style="margin: 0 auto; width: 1200px  ">
<input type="checkbox" id="all" onclick="selectall('chk[]','all');" style="margin-left: 20px "> 전체 선택
<div  class="checkclass">
<c:forEach var="basket" items="${basketList}">
	<div style="float: left; margin-left: 20px"><input type="checkbox"  id="chk" name="chk[]"><input type="hidden" id="item_name" value="${basket.item_name}"></div>
	<div style="float: left; width: 400px;margin-left: 10px;text-align: center;"><a href="${basket.item_url }"><font size="3px">${basket.item_name}</font></a></div>
	<div ><font size="3px">${basket.item_price }</font></div><br>
	
	<!--나중에 주문 테이블로 넘어갈때 정보 히든으로 입력하면 될듯 -->
	
</c:forEach>
</div>

   
	<input type="button" value="삭제" id="delete"/>
	<input type="button" value="주문하기" />
</div>
</body>
</html>