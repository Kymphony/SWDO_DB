<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/update.js"></script>
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>

<div>
<form action="infoUpdate" method="post" onsubmit="return check()">
<table align="center">
	<tr>
		<td colspan="3" align="center"><h1>GAVER</h1></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><p>${data.getCustid()}</p></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="4자 이상 입력하세요" 
			onmouseover="this.style.backgroundColor='tranarent'" style="height:45px; width:210px;"></td>
			
	</tr>
	<tr>
		<th>비밀번호 재확인</th>
		<td><input type="password" id="passwordcheck" style="height:45px; width:210px;"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" value= "${data.getName()}" style="height:45px; width:210px;"></td>
	</tr>
	<tr>
		<th>가입 구분</th>
			<c:if test="${data.getDivision()=='일반회원'}">
				<td>
					<p>일반회원</p>
					<input type="hidden" name="division" id="idno1" value="일반회원">
				</td>
			</c:if>
			<c:if test="${data.getDivision()=='기업회원'}">
					<p>기업회원</p>
					<input type="hidden" name="division" id="idno2" value="기업회원">
			</c:if>
	</tr>
	<tr>
		<th>주민등록번호<br>(기업번호)</th>
		<td><input type="text" name="idno" id="idno" maxlength="13" placeholder=" - 없이 입력" pattern="[0-9]{13}" 
		value="${data.getIdno()}"style="height:45px; width:210px;"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email" id="email" value="${email1}">@
			<select name="email2" id="email2" style="width:180px">
				<option value="">직접 입력</option>
				<option value="@naver.com"<c:if test="${email2=='@naver.com'}">selected</c:if>>naver.com</option>
				<option value="@google.com"<c:if test="${email2=='@google.com'}">selected</c:if>>google.com</option>
				<option value="@hanmail.net"<c:if test="${email2=='@hanmail.net'}">selected</c:if>>hanmail.net</option>
				<option value="@daum.net"<c:if test="${email2=='@daum.net'}">selected</c:if>>daum.net</option>
				<option value="@nate.com"<c:if test="${email2=='@nate.com'}">selected</c:if>>nate.com</option>
				<option value="@yahoo.com"<c:if test="${email2=='@yahoo.com'}">selected</c:if>>yahoo.com</option>
				
			</select>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2"><textarea rows="4" cols="40" name="address" id="address"
		style="height:50px; width:300px;"></textarea></td>
	</tr>
	<tr>
		<td colspan="3" align="center" class="submit"><input type="submit" value="수정" style="height:30px; width:100px;"></td>
	<tr>

</table>
</FORM>
</div>
</body>
</html>