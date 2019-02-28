<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AJ1</title>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		//서버 호출
		$('#bt1').on('click',call1);
		//서버와 데이터 주고받기
		$('#bt2').on('click',call2);
	});
	
function call1(){
	alert('call-1 실행');
	//		↓중괄호로 둘러싸인게 자바스크립트에서는 객체.속성과 값을 쉼표로 쭉 늘어놓는다
	$.ajax({
			url:		'ajaxtest1',//서버에서 받아주는 경로. 리퀘스트매핑의 value과 같음. 가야 할 곳
			type:		'GET',//(서버로 갈 때)요청 방식.
			dataType:	'text',//(서버에서 돌아올 때)가지고 올 데이터의 자료형 결정. 'text' or 'json'들어감
			success:	output1,//성공시 output1 메서드 불러와서 실행(코딩이 길때). 괄호 없이!
			error:		function(e){alert(JSON.stringify(e));}//실패시 즉석에서 함수 만들어 실행(코딩이 짧을때)
		   });								//↓object의 내용을 스트링으로 구체화하는것
}

function call2(){
	$.ajax({
		url:		'ajaxtest2',
		type:		'GET',
		data:		{str:'abcd'},/*서버쪽으로 보낼 데이터. 리퀘스트 매핑에서 받아줘야 한다.
								   http://localhost:8888/ajax/ajaxtest2?str='abcd'*/
		dataType:	'text',//←서버에서 받을 데이터의 자료형.output2()에 파라미터로 꽂는다.
		success:	output2,
		error:		function(e){alert(JSON.stringify(e));}
	   });									
}

function output1(){alert('성공');}
function output2(s){alert('서버에서 가져온 값  : ' + s);}

</script>
</head>
<body>
<h1>[	Ajax로 서버와 통신하기	]</h1><br>
<input type="button" id="bt1" value="서버 호출"><br><br>
<input type="text"><br>
<input type="button" id="bt2" value="서버와 데이터 주고 받기"><br><br>
</body>
</html>