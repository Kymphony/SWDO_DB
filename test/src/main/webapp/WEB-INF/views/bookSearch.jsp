<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 검색</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#searchButton').on('click',runSearch);
	
});

function runSearch(){
	
	alert('runSearch 메서들 실행합니다 by 자바스크립트');
	var bookName = $('#bookName').val();
	
	
	$.ajax({
			
			url:		'bookSearch',
			type:		'POST',
			data:		{bookName: bookName},
			dataType:	'json',
			success:	function(data){
								
								console.log(data);
				
								},
			error:		function(e){alert(JSON.stringify(e));}
	
		   });
}

/* function searchData(data){
	alert(data);
} */

</script>

</head>
<body>

<div style="height: 200px; width: 500px; margin: 1px auto; background-color: green;">
	<form id="searchText">
		<table align="center" style="vertical-align: middle;">
			<tr>
				<td>검색</td><td><input type="text" id="bookName"></td>
				<td><input type="button" id="searchButton" value="검색"></td>
			</tr>
		</table>	
	</form>
</div>

<div style="height: 900px; width: 600px; margin: 1px auto; background-color: white;">
	<c:if test="${data == null}">
		<table>
			<tr>
				<td>검색 결과가 없습니다.</td>
			</tr>			
		</table>
	</c:if>
	
	<c:if test="${data != null}">
		<table>
			<c:forEach var="bookInfo" items="${data}">
				<tr>
					<td><p>${data}</p></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<div id="print" style="height: 900px; width: 600px;">

</div>

</body>
</html>