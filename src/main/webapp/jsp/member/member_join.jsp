<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="assets/css/main.css" />
<script src="<%=request.getContextPath()%>/assets/js/member.js?v=3"></script> 
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>나색</strong> '나만의 색상 찾기'</a>
					<ul class="icons">
						<li><a href="member_login.nhn" class="member_login"><span class="label">로그인</span></a></li>
						<li><a href="member_join.nhn" class="member_join"><span class="label">회원가입</span></a></li>
					</ul>
				</header>
			</div>
			
			<!-- 회원가입 폼 -->
			<form name="f" method="post" action="member_join_ok.nhn" onsubmit="return check()"
					enctype="multipart/form-data">
			<section id="banner" style="display:inline-block;left:50%;top:50%;">
					<div class="content">
					<div>
						<label>아이디</label>
						<input id="mem_id" name="mem_id" placeholder="아이디 입력" size="14"/>
						<input type="button" value="아이디 중복체크" class="input_button"
							onclick="id_check()"/>
						<div id="idcheck"></div>
					</div>
					<div>
						<label>비밀번호</label>
						<input type="text" id="mem_pwd" name="mem_pwd" placeholder="비밀번호 입력" maxlength="20">
					</div>
					<div>
						<label>비밀번호 확인</label>
						<input type="text" id="mem_pwd_re" name="mem_pwd_re" placeholder="비밀번호 확인" maxlength="20">
					</div>
					<div>
						<label>이름</label>
						<input type="text" id="mem_name" name="mem_name" placeholder="이름 입력" maxlength="7">
					</div>
					<div>
						<label>핸드폰 번호</label>
						<%@ include file="../../jsp/include/phone_number.jsp" %>
						<select name="mem_phone1">
							<c:forEach var="p" items="${phone}" begin="0" end="5">
								<option value="${p}">${p}</option>
							</c:forEach>
						</select>-<input name="mem_phone2" id="mem_phone2" size="4" maxlength="4" 
						class="input_box"/>-<input name="mem_phone3" id="mem_phone3" size="4" maxlength="4" 
						class="input_box"/>				
					</div>
					<div>
						<label>이메일</label>
						<input id="mem_email1" name="mem_email1" size="10" 
						placeholder="이메일 입력" class="input_box"/>@<input name="mem_email2" name="mem_email2" size="20" class="input_box" readonly/>
						<select	name="mem_email3" onchange="domain_list()">
							<option value="">==이메일 선택==</option>					
							<option value="daum.net">daum.net</option>					
							<option value="naver.com">naver.com</option>					
							<option value="gmail.com">gmail.com</option>										
						</select>
					</div>
					<div>
						<input type="submit" value="회원가입" class="input_button"/>
						<input type="reset" value="가입취소" class="input_button" onclick="$('#mem_id').focus();"/>
					</div>
					</div>
				</section>
			</form>
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

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>