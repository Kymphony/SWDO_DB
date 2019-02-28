<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>comment</title>
<style>
.formDiv{margin: 1px auto;}
.tdNum{background-color: #ffa64d;}
</style>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		list();//페이지가 로드되자마자 실행시키기
		$('#formButton').on('click',save);
	});
	
function save(){
	alert('save실행');
	var name = $('#name').val();
	var text = $('#text').val();
	if(name==''||text=='')return;//공란 입력 방지
	
	$.ajax({
		url:		'save',
		type:		'POST',
		dataType:	'text',
		data:		{name: name, text: text},
		success:	function output2(){
					alert('저장 되었습니다.');
					//입력칸 초기화
					$('#name').val('');
					$('#text').val('');
					list();//수정된 것 바로 출력시키기
					},
		error:		function(e){alert(JSON.stringify(e));}
		  });
}

//리플 목록 요청
function list() {
   	  
	  $.ajax({
      //작성자명과 리플 내용을 서버로 전송
      url : 'list',
      type : 'GET',
      dataType : 'JSON', //'text',   
      success : output,
      error : function(e){alert('리플 목록 읽기 실패');}
   });
}

function output(ob) {
    //alert(ob);
    //서버로부터 받은 리스트를 반복문으로 읽기
    var str = '<table align="center">';
    $.each(ob, function(key, item) {
       str += '<tr>';
       str += '<td class="tdNum">' + item.num + '</td>';
       str += '<td class="tdName">' + item.name + '</td>';
       str += '<td class="tdText">' + item.text + '</td>';
       str += '<td>';										//문자열에 구분하기 위한 변수값 끼워넣기
       str += '<input type="button" value="삭제" class="delete" datanum="'+item.num+'">';
       str += '</td>';												//datanum=""  ("")까먹지 않기
       str += '<td>';										//문자열에 구분하기 위한 변수값 끼워넣기
       str += '<input type="button" value="수정" class="edit" datanum="'+item.num+'">';
       str += '</td></tr>';     																
       str += '<tr><td colspan="5"><div id="editDiv'+item.num+'"></div></td></tr>';
    });
    str += '</table>';
    $('#listDiv').html(str);
	//삭제 기능은 여기서 부터 작성해야 한다. 위에서 작성해도 div 안의 값은 임시로 생기는 것이라 인식되지 않는다.
	//여러 개의 삭제 버튼이 id가 다 똑같다는 고민. class명은 중복되도 된다는 점을 활용
    $('.delete').on('click',commentDel);//ready 부분에 작성하면 실행안됨. delete가 만들어지기 이전이기 때문
    $('.edit').on('click',commentEdt);
 }

//리플 삭제
function commentDel(){
	//삭제 버튼 누르면 오는 곳(몇번째 버튼을 누르든 다 여기로 오게 됨)
	alert('삭제 버튼 실행');
	var num = $(this).attr('datanum'); //$(this)는 가장 최근에 클릭한 버튼을 가리킴
									   //최근에 클릭한 그 버튼의 datanum 속성을 읽어들여라
	  $.ajax({
	      //작성자명과 리플 내용을 서버로 전송
	      url : 'delete',
	      data : {num:num},
	      type : 'GET',
	      dataType : 'text',   
	      success : function (){list(); alert('삭제되었습니다.');},
	      error : function(e){alert('삭제 실패');}
	   });
}


//리플 수정
function commentEdt(){
	//삭제 버튼 누르면 오는 곳(몇번째 버튼을 누르든 다 여기/로  오게 됨)
	alert('수정 버튼 실행');
	var num = $(this).attr('datanum'); //$(this)는 가장 최근에 클릭한 버튼을 가리킴
									   //최근에 클릭한 그 버튼의 datanum 속성을 읽어들여라
	var div = $('#editDiv' + num); 
	
	var formStr = '<form id="editForm'+num+'">';
	formStr += '<input type="hidden" name="num" value="'+num+'">';
	formStr += '<input type="text" name="text" style="width:300px;">';
	formStr += '<input type="button" class="btnEdt" value="완료" datanum="'+num+'">';
	formStr += '</form>';
	div.html(formStr);
	
	//수정할 텍스트 입력후 '완료'버튼 눌렀을때 ajax실행
	$('.btnEdt').on('click',function(){
		 $.ajax({
			    //작성자명과 수정 내용을 서버로 전송
		   url : 'edit',
		   data : $('#editForm'+num).serialize(),
		   type : 'POST',
		   dataType : 'text',   
		   success : function (){list(); alert('수정되었습니다.');},
		   error : function(e){alert('수정 실패');}
		  });
	});
}
</script>
</head>
<body>
	<h1>[리플 달기]</h1>
	<!-- 리플 작성 폼 영역 -->
	<div id="formDiv">
	<form id="writeForm">
	이름 <input type="text" id="name" name="name" style="width:100px;">
	내용 <input type="text" id="text" name="text" style="width:300px;">
	   <input type="button" id="formButton" value="저장">
	</form>
	</div>
	<br><br>
	<!-- 리플 목록 출력 영역 -->
	<div id="listDiv"></div>
</body>
</html>