<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JS4</title>

<script>

var naver;

function test1(){
	naver = window.open('','naver','height=500','width=500','location=no');
	
	//setInterval(function move(){naver.moveBy(5,5);}, 100);
}

function test2(){
	naver.resizeTo(500,900);
	naver.moveTo(500,200);
	naver.focus();
}

function test3(){
	naver.focus();
	naver.document.write('<html><head><title>새창</title></head>');
	naver.document.write('<body>또잉</body>');
}

function test4(){
	var w = screen.width;
	var h = screen.height;
	
	//창을 화면의 1/2크기로 정 중앙에 연다
	var tt = window.open('','reposition','width='+ w/2 + ',height=' + h/2 + ',left=' + w/4 + ',top=' + h/4);
	//naver.resizeTo(w/2,h/2);
	//tt.moveTo(w/4,h/4);
}

function test5(){
	var url = location.href;
	alert('현재 URL' + url);
	var url = 'http://www.naver.com';
	location.href = url;
}

function test6(){
	
	var user = navigator.userAgent;
	
	var pc = 'Windows';
	var mobile = ['Mobile','Android','iPhone'];
	
	//모바일로 접속했을 때에는 http://localhost:8888/ajax/mobile로 이동
	if(user.includes("Mobile")){
		alert('Mobile이다!');
		var url = 'http://172.30.1.34:8888/ajax/mobile';
		location.href = url;
		return;
	}
	
	//PC로 접속했을 때에는 http://localhost:8888/ajax/pc로 이동
	if(user.includes("Window")){
		alert('PC다!');
		var url = 'http://localhost:8888/ajax/pc';
		location.href = url;
		return;
	}
}

var admove;

window.onload = function(){
	admove = window.open('','ad','width=300, height=300',);
	setInterval(ad,20);
	}

function ad(){
	admove.moveBy(5,0);
}
</script>

</head>
<body>
<h1>[	브라우저 객체 모델	]</h1>

<input type="button" value="window객체1" onclick="test1()">
<input type="button" value="window객체2" onclick="test2()">
<input type="button" value="document객체" onclick="test3()">
<input type="button" value="화면크기 출력" onclick="test4()">
<input type="button" value="URL주소 출력 후 네이버 이동" onclick="test5()">
<input type="button" value="userAgent 출력" onclick="test6()">

</body>
</html>