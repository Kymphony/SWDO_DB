
function check(){
	
	var id = document.getElementById('custid');//아이디
	var pw1 = document.getElementById('password');//비번
	var pw2 = document.getElementById('passwordcheck');//비번재확인
	var name = document.getElementById('name');//이름
	var idno = document.getElementById('idno');//주민번호
	var email = document.getElementById('email');//이메일
	var add = document.getElementById('address')//주소
	
	//아이디 3자 이상 입력
	if(id.value.length < 3){alert('아이디를 3자 이상 입력하세요.');return false;}
	
	//비밀번호 4자 이상 입력
	if(pw1.value.length < 4){alert('비밀번호는 4자 이상 입력하세요.');return false;}
	
	//비밀번호 재확인
	if(pw1.value != pw2.value){alert('비밀번호를 확인하세요.');pw2.focus();return false;}
	
	//공란 방지
	if(name.value.length == 0 || idno.value.length == 0 || email.value.length == 0 || add.value.length == 0){
		alert('입력하지 않은 정보를 확인해 주세요');return false;
	}
	
	return true;
}

function board_check(){
	
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	
	if(title.length < 2){alert('제목은 2글자 이상 입력하세요.');return false;}
	if(content.length < 1){alert('글 내용은 1글자 이상 입력하세요.');return false;}
	else{alert('글이 수정되었습니다.');}
	
	return true;
}

function board_upload(){
	
	var title = document.getElementById('title');
	var content = document.getElementById('content');
	
	if(title.length < 2){alert('제목은 2글자 이상 입력하세요.');return false;}
	if(content.length < 1){alert('글 내용은 1글자 이상 입력하세요.');return false;}
	else{alert('글이 작성되었습니다.');}
	
	return true;
}



function formSubmit(page){
	var form = document.getElementById('pagingForm'); //검색폼
	var page = document.getElementById('page');		  //히든항목
	page.value = page;	 							  //page에 바로바로 value값 대입시키기
	form.submit();
}

function logincheck(){
	
	var id = document.getElementById('custid');
	var pw = document.getElementById('password');
	
	if(id.value.length == 0){alert('아이디를 입력해 주세요');return false;}
	if(pw.value.length == 0){alert('비밀번호를 입력해 주세요');return false;}
	if(id.value.length < 3){alert('아이디를 3자 이상 입력하세요');return false;}
	if(pw.value.length < 4){alert('비밀번호를 4자 이상 입력하세요');return false;}
	
	return true;
}
//아이디 중복검사
/*function idcheck(){
	window.open("idCheck","idWin","");
}*/