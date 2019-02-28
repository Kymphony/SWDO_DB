<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
</head>
<body>
<div>
<table align="center">
	<tr>
		<td colspan="3" align="center"><h1>GAVER</h1></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><p>${updatedData.getCustid()}</p></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><p>${updatedData.getName()}</p></td>
	</tr>
	<tr>
		<th>가입 구분</th>
 			<c:if test="${updatedData.getDivision()=='일반회원'}">
				<td>일반회원</td>
			</c:if>
			<c:if test="${updatedData.getDivision()=='기업회원'}">
				<td>기업회원</td>
			</c:if>
	</tr>
	<tr>
		<th>주민등록번호<br>(기업번호)</th>
		<td><p>${updatedData.getIdno()}</p></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<p>${updatedData.getEmail()}</p>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2"><p>${updatedData.getAddress()}</p></td>
	</tr>
	<tr>
		<td colspan="3" align="center" class="submit"><a href="./"><input type="submit" value="확인" style="height:30px; width:100px;"></a></td>
	<tr>

</table>
</div>


</body>
</html>