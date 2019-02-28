
function check(){
	
	var pw1 = document.getElementById('password');//비번
	var pw2 = document.getElementById('passwordcheck');//비번재확인
	var name = document.getElementById('name');//이름
	var idno = document.getElementById('idno');//주민번호
	var email = document.getElementById('email');//이메일
	var add = document.getElementById('address')//주소
	
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

//아이디 중복검사
/*function idcheck(){
	window.open("idCheck","idWin","");
}*/