<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이미지저장</h3>
<form action="/uploadImage.nhn" enctype="multipart/form-data" method="post">
    <input type="file" name="file" />
    <input type="submit" value="이미지저장"/>
</form>

<br>
<h3>아이템저장</h3>
<form action="/uploadItem.nhn" enctype="application/x-www-form-urlencoded" method="post">
<h5>아이템제목</h5>
	<input type="text" name="item_title">
<h5>아이템가격</h5>
	<input type="number" name="item_price">
<h5>아이템할인률</h5>
	<input type="number" name="item_discount">
<h5>아이템재고</h5>
	<input type="number" name="item_stock">
<h5>아이템설명(사진번호)</h5>
	<input type="number" name="item_description">
<h5>아이템썸네일(사진번호)</h5>
	<input type="number" name="item_thumbnail">
<br>
    <input type="submit" value="아이템저장"/>
</form>

</body>
</html>