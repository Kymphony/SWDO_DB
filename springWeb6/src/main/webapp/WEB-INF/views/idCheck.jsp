<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<script src="resources/js/js.js"></script>

<script>
	function selectId(){
		var id = opener.document.getElementById('custid');//오프너의 custid를 인식하여
		id.value = '${custid}'; //오프너의 custid에 원하는 값을 대입시킴
		this.close(); // 현재 창 닫음
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>

<div align="center">
<form action="idCheck" method="post" onsubmit="return check()">
<table align="center">
	<tr><td>　</td></tr>
	<tr>
		<td width="300"><input type="text" id="custid" name="custid" value="${custid}" style="width:200px; height:40px;  text-align:center;"></td>
		<td width="100"><input type="submit" value="확인"></td>
	</tr>									<!-- 처음에는 아무것도 없지만, 검색하고 나서는 검색한 값이 입력칸에 남아있도록 -->
	
	<!-- 3가지 경우 대비 1)검색하기 전에 null인 상태, 2)검색을 했지만 아이디가 없어서 null인 상태, 3)검색했더니 사용중인 아이디가 있는 상태 -->
	<c:if test="${std}"><!-- 검색하고 돌아온 경우 -->
		<c:if test="${result != null}">
		<tr>
			<td colspan="2"><p>이미 사용중인 아이디 입니다.</p></td>
		</tr>
		</c:if>
		<c:if test="${result == null}">
		<tr>
			<td><p>사용가능한 아이디 입니다.</p></td>
			<td><a href="javascript:selectId()"><input type="button" value="사용하기"></a></td>
		</tr>
		</c:if>
	</c:if>
</table>
</FORM>
</div>
</body>
</html>