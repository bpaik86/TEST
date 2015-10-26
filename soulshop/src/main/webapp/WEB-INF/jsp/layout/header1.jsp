<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>:::남자의 감성 쇼핑몰:::</title>
<!-- CSS -->
<link href="/css/header/style.css" rel="stylesheet">
<link href="/css/header/menu.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#search').on('click',function(){
		var is=$('#context').val();
		if(is==""){
			alert("검색할 상품명을 입력해주세요");
			return false
		}
	});
	$('#jang').on("click",function(){
		var test=$('input[name=session]').val();
		
		if(test==""){
			var gologin=confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니가?");
			if(gologin==true){
				location.href("/login.soul");
				return false;
			}else{
				return false;
			}
		}
		
	
	});
	$('#jumoon').on("click",function(){
		var test=$('input[name=session]').val();
		
		if(test==""){
			var gologin=confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니가?");
			if(gologin==true){
				location.href("/login.soul");
				return false;
			}else{
				return false;
			}
		}
	});
	
})
</script>
</head>
<body leftmargin="0" topmargin="0" marginheight="0" ddffsdf="0">
	<div id="wrapper">
		<div id="header">
			<div class="gnb">
				<div class="wrap_inner">
					<input type="hidden" name="session" value="${sessionScope.member.shop_mem_id }" />
					<!--SNS <div class="hd_sns">
				  <a href="#" target="_blank"><img src="images/hd_facebook.gif" alt="페이스북"></a>
				  <a href="#" target="_blank"><img src="images/hd_blog.gif" alt="블로그"></a>
				</div>-->
					<ul>
						<c:choose>
							<c:when test="${not empty sessionScope.member }">
						<li><a href="/logout.soul">로그아웃</a></li>
						<li><a href="/mypage_modify.soul">${sessionScope.member.shop_mem_name } 님</a></li>
							</c:when>
							<c:otherwise>
						<li><a href="/login.soul">로그인</a></li>
						<li><a href="/agreement.soul">회원가입</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${sessionScope.member.shop_mem_id =='admin' }">
								<li><a href="/admin.soul" id="admin">관리자페이지</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="/basket.soul" id="jang">장바구니</a></li>
							<li><a href="/orderListView.soul" id="jumoon">주문내역</a></li>
							</c:otherwise>
						</c:choose>
						
							
					</ul>
				</div>
			</div>
			<div class="logo_search">
				<div class="wrap_inner">
					<h1>
						<a href="/"><img src="/images/header/logo.jpg" alt=""></a>
					</h1>


					<div class="h_search">
						<form action="item_search.soul" method="post">
							<input type="text" name="search" id="context"><input type="image"	src="/images/header/search.png"  id="search"/>
						</form>


					</div>
				</div>
			</div>


			<div class="category header_normal">
				<div class="wrap_inner">
					<ul class="dropdownmenu">
						<li><a href="/main.soul">Home</a></li>
						<li><a>TOP</a>
							<ul>
								<li><a href="/item_list.soul?cat=t1">긴팔</a></li>
								<li><a href="/item_list.soul?cat=t2">반팔</a></li>
								<li><a href="/item_list.soul?cat=t3">맨투맨</a></li>
							</ul></li>
						<li><a>PANTS</a>
							<ul>
								<li><a href="/item_list.soul?cat=p1">면바지</a></li>
								<li><a href="/item_list.soul?cat=p2">청바지</a></li>
								<li><a href="/item_list.soul?cat=p3">반바지</a></li>
							</ul></li>
						<li><a>OUTER</a>
							<ul>
								<li><a href="/item_list.soul?cat=o1">자켓</a></li>
								<li><a href="/item_list.soul?cat=o2">가디건</a></li>
								<li><a href="/item_list.soul?cat=o3">코트</a></li>
							</ul></li>
						<li><a>SHOES</a>
							<ul>
								<li><a href="/item_list.soul?cat=s1">부츠</a></li>
								<li><a href="/item_list.soul?cat=s2">구두</a></li>
								<li><a href="/item_list.soul?cat=s3">스니커즈</a></li>
							</ul></li>
						<li><a>ACC</a>
							<ul>
								<li><a href="/item_list.soul?cat=a1">모자</a></li>
								<li><a href="/item_list.soul?cat=a2">벨트</a></li>
								<li><a href="/item_list.soul?cat=a3">선글라스</a></li>
							</ul></li>

						<li><a href="/photozone.soul">포토리뷰</a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>