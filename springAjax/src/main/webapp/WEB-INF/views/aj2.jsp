<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AJ2</title>
<style>
th{background-color: black; color: white;}
td{background-color: grey; color: black;}
</style>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		//parameter 각각 전달
		$('#formButton1').on('click',call1);
		//VO 객체로 전달
		$('#formButton2').on('click',call2);
		//form 으로 전달 : serialize()
		$('#formButton3').on('click',call3);
		//서버에서 문자열 받기
		$('#bt1').on('click',call4);
		
		$('#bt2').on('click',call5);
	});

function call1(){
	alert('call1 실행');
	var name = $('#name').val();
	var age = $('#age').val();
	var phone = $('#phone').val();
	
	$.ajax({
		url:		'insert1',//서버에서 받아주는 경로. 리퀘스트매핑의 value과 같음. 가야 할 곳
		type:		'POST',//(서버로 갈 때)요청 방식.
		dataType:	'text',//(서버에서 돌아올 때)가지고 올 데이터의 자료형 결정. 'text' or 'json'들어감
		data:		{name/*VO객체의 속성 같은 것*/: name/*위에 있는 var name 가리킴*/, age: age, phone: phone},
		success:	function output1(){
					alert('저장 되었습니다.');
					//입력칸 초기화
					$('#name').val('');
					$('#age').val('');
					$('#phone').val('');
					},
		error:		function(e){alert(JSON.stringify(e));}//실패시 즉석에서 함수 만들어 실행(코딩이 짧을때)
	   });
}

function call2(){
	alert('call2 실행');
	var name = $('#name2').val();
	var age = $('#age2').val();
	var phone = $('#phone2').val();
	
	$.ajax({
		url:		'insert2',//서버에서 받아주는 경로. 리퀘스트매핑의 value과 같음. 가야 할 곳
		type:		'POST',//(서버로 갈 때)요청 방식.
		dataType:	'text',//(서버에서 돌아올 때)가지고 올 데이터의 자료형 결정. 'text' or 'json'들어감
		data:		{name: name, age: age, phone: phone},
		success:	function output2(){
					alert('저장 되었습니다.');
					//입력칸 초기화
					$('#name2').val('');
					$('#age2').val('');
					$('#phone2').val('');
					},
		error:		function(e){alert(JSON.stringify(e));}//실패시 즉석에서 함수 만들어 실행(코딩이 짧을때)
	   });
	
}

function call3(){
	alert('call3 실행');
	var name = $('#name3').val();
	var age = $('#age3').val();
	var phone = $('#phone3').val();
	
	$.ajax({
		url:		'insert3',
		type:		'POST',
		dataType:	'text',
		data:		$('#writeForm3').serialize(),//serialize()-Form으로 전송
		success:	function output3(){
					alert('저장 되었습니다.');
					//입력칸 초기화
					$('#name3').val('');
					$('#age3').val('');
					$('#phone3').val('');
					},
		error:		function(e){alert(JSON.stringify(e));}//실패시 즉석에서 함수 만들어 실행(코딩이 짧을때)
	   });	
}

function call4(){
	
	$.ajax({
		url:		'jsontest',
		type:		'GET',
		dataType:	'text',
		success:	function output4(ob){//return된 person을 parameter ob로 받음
						$('#outputDiv1').html(ob);//문자열 ob를 div의 빈칸에 삽입
					},
		error:		function(er){alert(JSON.stringify(er));}
	});
}

function call5(){
	alert('call5 실행');
	$.ajax({
		url:		'jsontest2',
		type:		'GET',
		dataType:	'json', // text가 아닌 json으로 받는다 
		success:	function output5(ob){//return된 person을 parameter ob로 받음
						var str = '<table><tr><th>이름</th><td>'+ob.name+'</td><tr>';
						str += '<tr><th>나이</th><td>'+ob.age+'</td></tr>';
						str += '<tr><th>번호</th><td>'+ob.phone+'</td></tr></table>'
						$('#outputDiv2').html(str);
					},
		error:		function(er){alert(JSON.stringify(er));}
	});
}
</script>
</head>
<body>
<h1>[	Ajax로 서버와 통신하기2	]</h1><br><br>
<p>1. 서버로 각각의 parameter를 전달</p><br>
<form id="writeForm1"> <!-- action과 method를 설정할 필요 없다 -->
	이름<input type="text" id="name"><br><!-- name을 설정할 필요 없다. -->
	나이<input type="text" id="age"><br>
	전화<input type="text" id="phone"><br>
	<input type="button" id="formButton1" value="각각의 parameter로 저장"><br><!-- submit이 필요 없다. -->
</form><br><br>

<p>2. 서버로 VO객체를 전달</p><br>
<form id="writeForm2"> <!-- action과 method를 설정할 필요 없다 -->
	이름<input type="text" id="name2"><br><!-- name을 설정할 필요 없다. -->
	나이<input type="text" id="age2"><br>
	전화<input type="text" id="phone2"><br>
	<input type="button" id="formButton2" value="서버로 VO객체를 저장"><br><!-- submit이 필요 없다. -->
</form><br><br>

<p>3. 서버로 Form을 전달</p><br>
<form id="writeForm3"> <!-- action과 method를 설정할 필요 없다 -->
	이름<input type="text" name="name" id="name3"><br><!-- form으로 보내기 위해선 name을 설정해준다. -->
	나이<input type="text" name="age" id="age3"><br>  <!-- name은 VO객체의 속성의 이름과 일치시킨다. -->
	전화<input type="text" name="phone" id="phone3"><br>
	<input type="button" id="formButton3" value="서버로 Form을 저장"><br>
</form><br><br>

<p>4. 서버에서 문자열 받기</p><br>
<input type="button" id="bt1" value="실행1"><br>
<div id="outputDiv1"></div><br><br>

<p>5. 서버에서 객체 받기</p><br>
<input type="button" id="bt2" value="실행2"><br>
<div id="outputDiv2">

</div><br><br>
</body>
</html>