<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JS3</title>

<script>

function stringTest1(){
	
	var text = document.getElementById('text');
	var output = document.getElementById('output');
	var n = text.value.length;
	
	output.innerHTML = '길이:' + n;
}

function stringTest2(){
	
	var text = document.getElementById('text');
	var output = document.getElementById('output');
	var n = text.value.charAt(0);
	
	output.innerHTML = '0번 글자:' + n;
}

function stringTest3(){
	
	var text = document.getElementById('text');
	var output = document.getElementById('output');
	var check = document.getElementById('check');
	var n = text.value.match(check.value);
	
	if(n != null){output.innerHTML = "있습니다.";}
	else{output.innerHTML = "없습니다.";}
}

</script>

<p>문자열 입력: <input type = "text" id="text"></p>
<div id = "output"></div>
 
<p><input type="button" value="문자열 길이" onclick="stringTest1()">
<p><input type="button" value="0번 글자" onclick="stringTest2()">
<p><input type="text" id="check" name="check" placeholder="이 글자가"> 
	<input type="button" value="있는지 없는지" onclick="stringTest3()">

</head>
<body>

</body>
</html>