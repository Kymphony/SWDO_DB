<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/js.js"></script>
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<div>
<form action="login" method="post" onsubmit="return logincheck()">
	<h1 align="center">GAVER</h1>
	<table align="center">
		<tr><td>　</td></tr>
		<tr>
			<td>
			<p align="left" style="font-size:12px;">
			　　　　　　　&nbsp;&nbsp;&nbsp;아이디</p> 
			<input type="text" name="custid" id="custid" style="height:45px; width:210px; text-align:center;"></td>
		</tr>
		<tr>
			<td><p align="left" style="font-size:12px;">
			　　　　　　　&nbsp;&nbsp;&nbsp;비밀번호</p>
			<input type="password" name="password" id="password" style="height:45px; width:210px; text-align:center;"></td>
		</tr>
		<tr><td colspan="2">　</td></tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인" style="width: 120px; height: 50px;"></td>
		</tr>
		<tr><td>　</td></tr>
		<c:choose>
			<c:when test="${error1=='없는 아이디 입니다.'}">
				<tr><td colspan="2"><p>${error1}</p></td></tr>
			</c:when>
			<c:when test="${error2=='비밀번호를 다시 입력해 주세요.'}">
				<tr><td colspan="2"><p>${error2}</p></td></tr>
			</c:when>
		</c:choose>
	</table>
</form>
</div>
</body>
</html>