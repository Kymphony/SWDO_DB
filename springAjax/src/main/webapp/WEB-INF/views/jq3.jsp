<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JQ3</title>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
	//클래스 연결 addClass
	$('#bt1').on('click',test1);
	//클래스 연결 해제 removeClass
	$('#bt2').on('click',test2);
	//클래스 연결 중첩 addClass('text2 text3')
	$('#bt3').on('click',test3);
	//기존 클래스에 더해 클래스 추가 
	$('#bt4').on('click',test4);
	//정수 배열
	$('#bt5').on('click',test5);
	//문자 배열
	$('#bt6').on('click',test6);
	//이미지 참조 주소(src) 바꾸기 
	$('#img').on('click',imageTest);
	//링크 제거
	$('#bt7').on('click',linkTest);
	//3초 마다 사진 바꾸기
	$('#change').on('click',change);
	
	$('#bt8').on('click',test7);
	
	$('#bt9').on('click',test8);
});

function test1(){
	//클래스가 선언되지 않은 태그에 클래스 연결해주기
	$('#p1').addClass('text3');
}

function test2(){
	//jq로 클래스가 연결된 태그에 text3 클래스 연결해제
	$('#p1').removeClass('text3');
	//p1에 연결된 모든 클래스 해제
	$('#p1').removeClass();
}

function test3(){
	//클래스 2개 이상 중첩해서 사용하기
	$('#p1').addClass('text2 text3');
}

function test4(){
	//기존 클래스에 더해 클래스 추가
	$('p').addClass('text5');
}

function test5(){
	//숫자 배열
	var ar = [10, 20, 30, 40];
	$(ar).each(function(i,n){
		/* each - 배열의 갯수만큼 실행. 배열 ar의 속성 갯수는 4개 이므로 4번 실행
		   for문과 마찬가지로 i는 인덱스. 0~부터 시작하여 1씩 증가
		   n은 배열의 i번째 값. 0-10 / 1-20 / 3-30 / 4-40 */
		   
	alert('as배열의 '+ i +'번째 값은 ' + n +'이다.');});

}

function test6(){
	//문자열 배열
	var sar = ['aaa', 'bbbb','cc'];
	
	$(sar).each(function(i,str){
	alert('sar배열의 ' + str.length + '번째 값은' + str + '이다.');});
}

function imageTest(){
	//attr로 이미지 첨부 주소 바꾸기(이미지 바꾸기)
	var s = $('#img').attr('src','resources/pic/bigpicture.jpg');
}

function linkTest(){
	//기존의 링크 제거
	var s = $('#naver').removeAttr('href');
}
var n = 1;
function change(){
	setInterval(function(){
		var s = $('#minju').attr('src');
		if(n<=2){$('#minju').attr('src','resources/pic/minju' + n + '.jpg');}
		if(n>2){$('#minju').attr('src','resources/pic/minju' + n + '.gif');}	
		if(n==4){n = 1;}
		n++;
		},3000);
}

function test7(){
	//id로 읽어오기
	var a = $('#output').html();
	alert(a);
	var b = $('#output').text();
	alert(b);
	
	//태그 선택자로 읽어오기
	var c = $('p').html();//배열로 가져옴
	alert(c);
	var d = $('p').text();//문자열로 줄줄이 이어서 가져옴
	alert(d);
	
	//태그를 html로 읽어온 것을 반복문으로 출력
	$('p').each(function (i,str){//str은 각각의 p태그 객체
		alert(i+'번째 p태그의 내용 : ' + $(str).html());
	});
}

function test8(){
	var div = $('#input').html();
	alert(div);//입력: <input type="text"><br>
	
	//입력태그가 추가되게 하기.
	div = div + '입력: <input type="text"><br>';
	$('#input').html(div);
}
</script>

<style>
.text1{color:blue; font-size: 10px;}
.text2{color:green; font-size: 20px;}
.text3{font-size: 30px; font-weight:bolder;}
.text4{text-align: center; border: 1px solid blue;}
.text5{text-align: center;}
</style>

</head>
<body>
<h1>[	문서 객체 다루기	]</h1>
<input type="button" id="bt1" value="클래스 속성 추가"><br><br>
<input type="button" id="bt2" value="클래스 속성 제거"><br><br>
<input type="button" id="bt3" value="클래스 속성 중첩"><br><br>
<input type="button" id="bt4" value="기존 클래스에 클래스 일괄 추가 "><br><br>
<input type="button" id="bt5" value="정수 배열"><br><br>
<input type="button" id="bt6" value="문자 배열"><br><br>

<p class="text1">p태그 사용. text1 클래스</p>
<p class="text2">p태그 사용, text2 클래스</p>
<p class="text3">p태그 사용, text3 클래스</p>
<p id="p1">p태그 사용. 클래스 없음</p><br><br>

<!-- 이미지를 클릭하면 다른 그림으로 바꾸기 -->
<img src="resources/pic/ad.png" id="img"><br><br>

<!-- 링크를 누르면 네이버로 이동, '링크제거'를 누르면 누른 후에는 이동 안함 -->
<input type="button" id="bt7" value="링크 제거">
<a href="http://www.naver.com" id="naver">다른 사이트로 이동</a><br><br>

<!-- 3초 간격으로 다른 이미지로 바뀜 -->
<input type="button" id="change" value="3초마다 사진 바꾸기"><br>
<img src="" id="minju"><br><br>

<!-- 문서 객체 수정 -->
<input type="button" id="bt8" value="문서 객체 내부 읽기">
<div id="output">이곳에 뭔가 출력</div><br><br>
<input type="button" id="bt9" value="input div 내용 읽기"><br>
<div id="input">입력: <input type="text"><br></div>
</body>
</html>