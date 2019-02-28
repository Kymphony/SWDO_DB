<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JQ1</title>
<!-- j쿼리 파일 불러오기 -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script>
	$(document).ready(function(){
		//p태그에 색깔 주기
		$('p').css('color','black');
		
		//id 이용해 색깔 주기 - #
		$('#redtext').css('color','red');
		
		//class 이용해 색깔 주기 - .
		$('.bluetext').css('color','blue');
		
		//input 태그에 색깔 주기
		$('input[type="text"]').css('color','white');
		$('input[type="text"]').css('background','skyblue');
		$('input[type="password"]').css('background','yellow');
		//정렬, 값 입력
		$('input[type="text"]').css('text-align','center');
		$('input[type="text"]').val('val로 입력1');
		$('input[type="password"]').val('secret');
		
		//위치 필터 선택자로 테이블 꾸미기
		//(!) 마지막에 적용된 것이 전체를 덮어쓴다. = first를 마지막으로 빼야 배경색 검은색이 적용된다.
		$('td,tr').css('text-align','center');
		$('tr:odd').css('background','skyblue');//홀수
		$('tr:even').css('background','orange');//짝수
		$('tr:last').css('background','white').css('color','black');//마지막줄
		$('tr:first').css('background','black').css('color','white');//첫줄
	});
	</script>

</head>
<body>

<h1>[	JQuery 기본 문법	]</h1><br>

	<h3>J쿼리에서 $의 역할</h3><br>
	<p>p태그를 이용한 문자열</p>
	<p class="bluetext">class를 이용한 문자열</p>
	<p id="redtext">id를 이용한 문자열</p>
	<img src="resources/pic/ad.png"><br>
	
	<form action="test">
		<input type="text" id="text1" placeholder="아갈머리를 확 찢어버릴라"><br>
		<input type="text" id="text2" placeholder="어마마?"><br>
		<input type="password" id="password">
	</form>
<br>
	<table>
		<tr>
			<td>大学３年生の時</td><td>ボランティアサークル</td><td>열3</td><td>열4</td>
		</tr>
		<tr>
			<td>열5</td><td>열6</td><td>열7</td><td>열8</td>
		</tr>
		<tr>
			<td>열9</td><td>열10</td><td>열11</td><td>열12</td>
		</tr>
		<tr>
			<td>열13</td><td>열14</td><td>열15</td><td>열16</td>
		</tr>
		<tr>
			<td>열17</td><td>열18</td><td>열19</td><td>열20</td>
		</tr>
		<tr>
			<td>열21</td><td>열22</td><td>열23</td><td>열24</td>
		</tr>
	</table>
</body>
</html>