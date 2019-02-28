<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<script src="resources/js/js.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정하기</title>
</head>
<body>
<div>
<form action="contentUpdate" method="post" onsubmit="return board_check()">
	<h1 align="center">FREE BOARD</h1>
	<table align="center">
		<tr><td>　</td></tr>
		<tr>
			<td>
			<p align="center" style="font-size:12px;">제목</p> 
			<input type="text" name="title" id="title" value="${data.getTitle()}" style="height:45px; width:300px;"></td>
		</tr>
		<tr><td>　</td></tr>
		<tr>
			<td><p align="center" style="font-size:12px;">내용</p>
			<textarea rows="20" cols="80" name="content" id="content">${data.getContent()}</textarea></td>
		</tr>
		<tr><td colspan="2">　</td></tr>
		<tr>
			<td colspan="2">
			<input type="hidden" name="boardnum" id="boardnum" value="${data.getBoardnum()}">
			<input type="submit" value="수정완료" style="width: 120px; height: 50px;"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>