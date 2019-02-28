<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<script src="resources/js/js.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
</head>
<body>
<div>
<form action="write" method="post" enctype="multipart/form-data" onsubmit="return board_upload()">
	<h1 align="center">FREE BOARD</h1>
	<table align="center">
		<tr><td>　</td></tr>
		<tr>
			<td>
			<p align="center" style="font-size:12px;">제목</p> 
			<input type="text" name="title" id="title" style="height:45px; width:300px;"></td>
		</tr>
		<tr><td>　</td></tr>
		<tr>
			<td><p align="center" style="font-size:12px;">내용</p>
			<textarea rows="20" cols="80" name="content" id="content"></textarea></td>
		</tr>
		<tr><td colspan="2">　</td></tr>
		<tr>
			<td colspan="2"><input type="file" name="upload" size="30"
							style="height:30px; width:200px;"></td>
		</tr>
		<tr>
			
			<td colspan="2">
			<input type="hidden" name="id" id="id" value="${id}">
			<input type="submit" value="작성완료" style="width: 120px; height: 50px;"></td>
		</tr>
	</table>
</form>
</div>

</body>
</html>