<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JS2</title>

<script>

function arrayTest1(){
	var ar = [2,5,7,10];
	
	//배열에 있는 값 전부 보이기
	alert(ar);
	
	//한개씩 꺼내보기
	alert(ar[0]);
	alert(ar[1]);
	alert(ar[2]);
	alert(ar[3]);
	
	//배열의 길이 출력
	alert("ar의 길이를 출력: " + ar.length);
	
 	//반복문으로 출력(int i = 0이 아니라 var i = 0인 점에 주의)
 	for(var i = 0 ; i <= ar.length ; i++){
		alert(ar[i]);}
 	
 	//사용자에게 보이지 않고 콘솔(사용자의 웹 브라우저 콘솔)로 결과를 확인하려면
 	console.log('배열내용: '+ar);
 	
 	//push()
 	console.log('배열내용: '+ar);//2,5,7,10
 	ar.push(1);
 	console.log('배열내용: '+ar);//2,5,7,10,1
 	
 	//splice(x,y,z) : x번부터 y개 삭제,삭제된 자리에 대신 들어갈 y)
 	ar.splice(2,1,99);
 	console.log('배열내용: '+ar);//2,5,99,10,1
 	ar.splice(0,1,77);
 	console.log('배열내용: '+ar);//77,5,99,10,1
 	
 	//sort()
 	ar.sort();
 	console.log('배열내용: '+ar);//1,10,5,77,99
 	
 	var str = ['Apple','apple','Samsung','samsung','LG','lg'];
 	console.log('배열내용: '+str); //Apple,apple,Samsung,samsung,LG,lg
 	str.sort();
 	console.log('배열내용: '+str); //Apple,LG,Samsung,apple,lg,samsung
}

//웹에서 사용자가 배열에 값 추가하게 만들기

//전역변수 선언하여 초기화되지 않도록 함
var arr = [];
	
function arrayTest2(){
	var str = document.getElementById('text');
	
	//아무것도 입력되지 않았을때 메서드 종료
	if(str.value==''){return;}
	//str은 객체로서 오는 것이므로 str의 value를 뽑아내 push로 넣어주는 것
	arr.push(str.value);
	//입력 후 입력창 초기화시켜주기
	str.value='';
	str.focus();
	console.log('arr상태:'+ arr);
}


</script>
</head>
<body>

<li><a href="javascript:arrayTest1()">배열 사용</a></li>

<li>배열에 내용 추가</li>
<input type="text" id="text" name="text">
<input type="button" value="추가" onclick="arrayTest2()">

<p>
</body>
</html>