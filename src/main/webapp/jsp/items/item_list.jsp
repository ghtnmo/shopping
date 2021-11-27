<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>남성 프리미엄 19샵</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header class="major">
					<h2 style="width:100%; padding-top:50px;">BEST</h2>
				</header>
				<div class="posts">
					<c:forEach var="item" items="${itemList}">
							<article>
								<a href="/items/detail.nhn?item_code=${item.item_code}" class="image">
									<img src="/images/${item.item_thumbnail}" style="height:300px;" alt="" />
								</a>
								<h5 style="color: #8e1f29;">리뷰 ${item.review_count}</h5>
								<h3>${item.item_title}</h3>
								<p style="margin: 0 0 10px 0;">재고 : ${item.item_stock}개</p>
								
								<b style="color: #8e1f29; font-size:7px;">${item.item_discount}%</b>
								<b class="discounted_price" style="margin: 0 0 10px 0;">${item.item_discount}</b>
								<span style="font-size:7px; text-decoration:line-through;" class="origin_price">${item.item_price}</span>
							</article>
					</c:forEach>
				</div>
				<div class="paging" style="display: block; text-align: center;">		
					<c:if test="${paging.startPage != 1 }">
						<a href="/items/list/best.nhn?page=${paging.startPage - 1 }">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="/items/list/best.nhn?page=${p }">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/items/list/best.nhn?page=${paging.endPage+1 }">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
		<%@include file="/jsp/include/sidebar.jsp"%>
	</div>

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script>
		//할인된가격 계산 자바스크립트로 처리함
		$(document).ready(function(){
			$(".discounted_price").each(function(index,element){
				var origin_price = $(element).next().html();
				var discounted_rate= 1-($(element).html() /100);
				var discounted_price = origin_price * discounted_rate;
				discounted_price = Math.floor(discounted_price);
				console.log(discounted_price);
				$(element).html(discounted_price);
			})
		});
	</script>

</body>
</html>