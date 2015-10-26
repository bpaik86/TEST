<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script></script>
</head>
<body>
<%-- <jsp:forward page="/main.soul" /> --%>
<table>
<tr>
<td>로그인 정보 일반회원ID:play</td><td>PW: 1 </td>
</tr>
<tr>
<td><a href="jQuery.soul">자바스크립트 실험하는 페이지 입니다. </a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/order.soul">주문페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/membermanage_test.soul">회원리스트테스트</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/checkBox_test.soul">체크박스테스트</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/write_test.soul">다중업로드 테스트</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/showImages_test.soul">이미지 뿌리기</a></td>
</tr>
<tr>
<td><a href="main.soul">메인페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/login.soul">로그인페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/find_id.soul">아이디찾기페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/find_pw.soul">패스워드찾기페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/agreement.soul">이용약관페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/join_form.soul">회원가입 홈페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/join.soul">회원가입 완료 페이지</a></td>
</tr>

<tr>


<!-- <td><a href="http://localhost:8080/faq.soul">FAQ페이지</a></td> -->

<td><a href="<c:url value='/faq.soul'/>">FAQ페이지</a></td>


</tr>
<tr>


<!-- <td><a href="http://localhost:8080/faq_view.soul">FAQ 상세보기페이지</a></td> -->
 
<td><a href="<c:url value='/faq_view.soul'/>">FAQ 상세보기페이지</a></td>


</tr>
<tr>


<!-- <td><a href="http://localhost:8080/faq_insert.soul">FAQ 글쓰기페이지</a></td> -->

<td><a href="<c:url value='/faq_insert.soul'/>">FAQ 글쓰기페이지</a></td>


</tr>
<tr>


<!-- <td><a href="http://localhost:8080/faq_modify.soul">FAQ 수정페이지</a></td> -->

<td><a href="<c:url value='/faq_modify.soul'/>">FAQ 수정페이지</a></td>


</tr>

<tr>

<!-- <td><a href="http://localhost:8080/soulshop/qna.soul">Q&A페이지</a></td>
 -->

<td><a href="<c:url value='/qna.soul'/>">Q&A페이지</a></td>


</tr>
<tr>

<!-- <td><a href="http://localhost:8080/qna_view.soul">Q&A 상세보기페이지</a></td>
 -->

<td><a href="<c:url value='/qna_view.soul'/>">Q&A 상세보기페이지</a></td>


</tr>


<tr>


<!-- <td><a href="http://localhost:8080/qna_insert.soul">Q&A 글쓰기페이지</a></td> -->

<td><a href="<c:url value='/qna_insert.soul'/>">Q&A 글쓰기페이지</a></td>


</tr>



<tr>



<!-- <td><a href="http://localhost:8080/qna_modify.soul">Q&A 수정페이지</a></td> -->

<td><a href="<c:url value='/qna_modify.soul'/>">Q&A 수정페이지</a></td>



</tr>


<tr>



<!-- <td><a href="http://localhost:8080/qna_reply.soul">Q&A 답변페이지</a></td> -->

<td><a href="<c:url value='/qna_reply.soul'/>">Q&A 답변페이지</a></td>



</tr>

<tr>
<td><a href="http://localhost:8080/photozone.soul">포토존 페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/photo_view.soul">포토존 상세보기페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/photo_insert.soul">포토존 글쓰기페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/photo_modify.soul">포토존 수정페이지</a></td>
</tr>

<tr>
<td><a href="http://localhost:8080/mypage.soul">마이 페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/mypage_modify.soul">마이 페이지 수정페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/order_list.soul">마이 페이지 주문내역페이지</a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/basket.soul">마이 페이지 장바구니페이지</a></td>
</tr>

<tr>
<td><a href="http://localhost:8080/item_list.soul">아이템 페이지 </a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/item_view.soul">아이템 상세보기 페이지 </a></td>
</tr>

<tr>
<td><a href="http://localhost:8080/admin.soul">관리자 페이지 </a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/item_insert.soul">관리자 상품등록 페이지 </a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/item_modify.soul">관리자 상품수정 페이지 </a></td>
</tr>
<tr>
<td><a href="http://localhost:8080/member_management.soul">관리자 회원관리 페이지 </a></td>
</tr>
<tr>
<td><a href="/delivery_management.soul">배송 상태 관리 페이지 </a></td>
</tr>

</table>
</body>
</html>