<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JQ2</title>

<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script>
		//페이지에서 가장 먼저 실행되게 하려면 ready로
		$(document).ready(function(){
			$('#bigpic').hide();
			
			/*객체에 이벤트 연결하는 on (이벤트는 사용자가 하는 행동이다.)*/
			//클릭
			
			$('#bt1').on('click',function(){
				win = window.open('','bt1click','width=100','height=100');
				win.document.write('<body>클릭 이벤트</body>');
			})
			
			var win;
			//마우스 오버-아웃
			$('#smallpic').on('mouseover',showpic);
			$('#smallpic').on('mouseout',hidepic);
			$('#bt5').on('mouseover',function(){
				win = window.open('','','width=500','height=300');
				win.document.write('<body><img src="http://image.sportsseoul.com/2018/10/08/news/20181008172758_5.jpg" id="pic"></body>');
			});
			
			//html로 그림 나타내고 숨기기
			$('#bt4').on('mouseover',function(){
				$('#output').html('<img src="http://image.sportsseoul.com/2018/10/08/news/20181008172758_5.jpg">')
			});
			$('#bt4').on('mouseout',function(){
				$('#output').html('');
			});
			/*객체에서 이벤트 제거하는 off*/
			//클릭
			$('#bt1').off('click');//bt1에 연결된 모든 이벤트 제거
			
			//키보드 이벤트
			$('#text').on('keyup',outputText);
			
		});
		
	function showpic(){
		$('#bigpic').show();
	}
	
	function hidepic(){
		$('#bigpic').hide();
	}
	
	function outputText(){
		var text = $('#text').val();
		if(text.length < 4){$('#output2').html('4자 이상 입력하세요');}
		if(text.length >= 4){$('#output2').html('사용 가능한 아이디 입니다.');}
		if(text.length <= 12){$('#output3').html('  12/'+ text.length);}
		if(text.length > 12){$('#output2').html('<span style="color:red;">최대 글자수 초과</span>');}
	}
	</script>
</head>
<body>
<h1>[	JQuery 이벤트 처리	]</h1>


<input type="button" id="bt1" value="버튼1"><br><br>
<input type="button" id="bt2" value="버튼2"><br><br>
<input type="button" id="bt3" value="버튼3"><br><br>
<input type="button" id="bt4" value="바바 후미카"><br><br><span id="output"></span><br><br>
<input type="button" id="bt5" value="새 창에 write로 그림 띄우기"><br><br>

<img src="resources/pic/ad.png" id="smallpic"><br><br>
<img src="resources/pic/bigpicture.jpg" id="bigpic"><br><br>

<!-- 키보드 이벤트 -->
<span><input type="text" id="text"></span><span id="output3"></span><br>
<span id="output2"></span>

</body>
</html>