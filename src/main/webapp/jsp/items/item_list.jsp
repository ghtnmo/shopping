<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
					<article>
						<a href="#" class="image"><img src="/images/item_1.jpg" alt="" /></a>
						<h3>당일출고_[BOX소가죽]7cm키높이수제화 첼시부츠</h3>
						<p>(4) 240 ~ 280 (7cm)</p>
						<b>56,000원</b>
						<ul class="actions">
							<li><a href="#" class="button">리뷰 : 150</a></li>
						</ul>
					</article>
					<c:forEach var="item" items="${itemList}">
						<article>
						<a href="#" class="image"><img src="/images/${item.item_thumbnail}" alt="" /></a>
						<h3>${item.item_title}</h3>
						<p>재고 : ${item.item_stock}개</p>
						<b>가격 : ${item.item_price}원</b>
						<ul class="actions">
							<li><a href="#" class="button">리뷰 : 150</a></li>
						</ul>
					</article>
					</c:forEach>
				</div>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>메뉴</h2>
					</header>
					<ul>
						<li><a href="index.html">홈페이지</a></li>
						<li><a href="generic.html">회사 소개</a></li>
						<li><a href="elements.html">상품 소개</a></li>
						<li><span class="opener">오늘의 추천</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">디자인 예시</a></li>
						<li><a href="#">나만의 색상 분석</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<!-- 								<section>
									<header class="major">
										<h2>색상 소개</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="/images/pic07.jpg" alt="" /></a>
											<p>오늘의 쿨톤 의상 컨셉에 대해서 소개합니다.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section> -->

				<!-- Section -->
				<section>
					<header class="major">
						<h2 class="icon solid fa-phone">8877-8373</h2>
					</header>
					<ul class="contact">
						<li style="padding: 0;"><b>1번 : 배송 / 교환 / 환불관련<br />2번 :
								결제 / 회원관련
						</b>
							<p>오전 9시 ~ 오후 6시 / 토,일,휴일 휴무</p></li>
						<li style="padding-top: 20px; padding-left: 0;">- 전화 전 자주 묻는
							질문을 확인하세요.<br /> - 1:1문의를 통해서도 상담이 가능합니다.<br /> - 상품 문의는 각 상품
							Q&A를 이용하세요.<br />
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo /images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>

</body>
</html>