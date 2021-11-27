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
					<h2 style="width:100%; padding-top:50px;">DETAIL</h2>
				</header>
				<!-- 상품 정보 -->				
				<section style="display:flex; padding:0 ; flex-direction:row;">
					<img src="/images/${data.item_thumbnail}" style="width:47%;" alt="" />
					<div style="padding-left:30px; width:auto; display:inline-block;">
						<h2 style="padding-bottom:30px; border-bottom:2px solid black;">${data.item_title}</h2>
						<table>
							<tr>
								<th>소비자가</th>
								<td class="origin_price">${data.item_price}</td>
							</tr>
							<tr>
								<th>판매가</th>
								<td class="discounted_price">${data.item_discount}</td>
							</tr> 
							<tr>
								<th>재고수량</th>
								<td>${data.item_stock}</td>
							</tr>
							<tr>
								<th>주문수량</th>
								<td><input name=order_number type=number value=0 onChange="total_price(this)"></td>
							</tr>
						</table>
						<div style="margin-bottom:30px; border-bottom:1px solid black;"></div>
						<div>
							<b>총 상품금액</b> : <strong style="font-size:35px;" class='total_price'>0</strong><b> 원</b>
						</div>
						<div style="text-align:center;display: flex;justify-content: space-between;">
							<button style="width:47%">BUY</button>
							<button style="width:47%">CART</button>
						</div>
					</div>
				</section>
				<!-- 상세설명  -->
				<h2 style="width:100%; padding-top:50px;">상세설명</h2>
				<section>
					<img src="/images/${data.item_description}" style="width:100%;" alt="" />
				</section>
				<h2 style="width:100%; padding-top:50px;">리뷰 (${data.review_count})</h2>
				<section>
					<table>
					</table>
				</section>
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
		var origin_price = 0;
		var discounted_rate = 0;
		var discounted_price = 0;
		//할인된가격 계산 자바스크립트로 처리함
		$(document).ready(function(){
			origin_price = $('.origin_price').html();
			discounted_rate = 1-($('.discounted_price').html()/100);
			discounted_price = origin_price * discounted_rate;
			discounted_price = Math.floor(discounted_price);
			$('.origin_price').html(String(origin_price)+"원")
			$('.discounted_price').html(String(discounted_price) + "원");
			
			
			
		});
		function total_price(ele){
			console.log(discounted_price);
			console.log($(ele).val());
			var tot = discounted_price * $(ele).val();
			$('.total_price').html(tot);
		}
		
	</script>

</body>
</html>