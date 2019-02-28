<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JS1</title>

<script>
//첫 3초 경과시 출력
setTimeout(function output(){
	alert('3초 경과');
},3000);

//매 10초마다 출력
setInterval(function output2(){
	alert('10초 경과');
},10000)

//시계 만들어 출력 - toLocaleTimeString()
var myTimer = setInterval(myClock, 1000);
function myClock() {
  document.getElementById("demo").innerHTML = new Date().toLocaleTimeString();
}

function test1(){
	alert('test1() 실행');
}

function test2(str, num){
	alert('전달된 문자열' + str);
	var s =sum(num);
	alert(num + '까지의 합계' + s);
}

function sum(n){
	var s = 0;
	for (var i = 1; i <= n; i++){
		s += i; <%--5+4+3+2+1--%>
	}
	return s;
}
var num1 = 0;<%--함수 밖에 선언한 변수 num1(전역변수): 함수가 종료되도 값 남아있음. 웹 초기화시 증발--%>
function test3(){
	var num2 = 0; <%--함수 안에 선언한 변수 num2(지역변수): 함수가 종료시 값 증발--%>
	num1++;
	num2++;
	alert('num1:' + num1 + '\nnum2:' + num2);
}

function test4(){
	document.write('출력한 내용');
}

function test5(){
	var dv = document.getElementById("div1")
	dv.innerHTML = '출력한 내용';
}

function test6(){
	var sel = confirm('계속 하시겠습니까?');
	alert(sel);
	var input = prompt('입력하세요');
	alert(input);
	
	//정수가 아닌 경우에는 계산할 수 없다는 메세지 출력
	if(isNaN(input) || input==''){
		alert('숫자가 아닙니다.');
	}
	//정수인 경우는 곱하기 2해서 결과 출력
	else{
		var n = parseInt(input);
		n = n*2;
		alert(n);
	}
}

</script>

</head>
<body>
<h1>[	JavaScript 기본 문법	]</h1>
<ul>
	<li><a href="javascript:test1()">함수 정의, 호출</a></li>
	<li><a href="javascript:test2('abc',5)">parameter의 전달과 리턴값</a></li>
	<li><a href="javascript:test3()">전역변수와 지역변수</a></li>
	<li><a href="javascript:test4()">출력1 - write()함수</a></li>
	<li><a href="javascript:test5()">출력2 - innerHTML</a></li>
	<div id= "div1"></div>
	<li><a href="javascript:test6()">기타 함수</a></li>
	<li><p id="demo">Clock</p><button onclick="clearInterval(myTimer)">Stop</button></li>
	<li><a href="javascript:test()"></a></li>
	<li><a href="javascript:test()"></a></li>
	
</ul>

</body>
</html>