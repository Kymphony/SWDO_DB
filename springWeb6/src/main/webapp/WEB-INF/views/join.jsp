<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<script src="resources/js/js.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<script>
function idcheck(){
	window.open("idCheck","idWin",
				"top=200,left=500,width=400,height=300,menubar=no");//window는 바로 쓸 수 있는 메서드. 웹 브라우저를 의미함. 웹 브라우저의 객체화
	//window.open 웹 브라우저를 하나 여는 것
	//idCheck는 상대경로 마지막에 url주소를 덧붙이는 것. http://localhost:8888/web6/idCheck
	//idWin은 열어 놓은 창에 이름을 붙이는 것.
	//3번째 공란은 specs가 들어가는 위치로, 위삼스쿨을 참고한다
}
</script>
</head>
<body>
<!-- JS로 확인해야 할 사항 : 아이디 3자 이상, 비밀번호 재확인, 같은 아이디 있는지 확인-->
<div>
<form action="join" method="post" onsubmit="return check()">
<table align="center">
	<tr>
		<td colspan="3" align="center"><h1>GAVER</h1></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="custid" id="custid" 
			readonly="readonly" placeholder="아이디 중복확인을 먼저 이용하세요" 
			style="height:45px; width:210px; border-style:radius; text-align:center;"></td>
		<td class = "check"><input type="button" value="중복확인" onclick="idcheck()"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="4자 이상 입력하세요" 
			style="height:45px; width:210px; text-align:center;"></td>
			
	</tr>
	<tr>
		<th>비밀번호 재확인</th>
		<td><input type="password" id="passwordcheck" style="height:45px; width:210px; text-align:center;"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" style="height:45px; width:210px; text-align:center;"></td>
	</tr>
	<tr>
		<th>가입 구분</th>
		<td>일반회원<input type="radio" name="division" id="idno1" value="일반회원" checked>
			기업회원<input type="radio" name="division" id="idno2" value="기업회원"></td>
	</tr>
	<tr>
		<th>주민등록번호<br>(기업번호)</th>
		<td><input type="text" name="idno" id="idno" maxlength="13" placeholder=" - 없이 입력" pattern="[0-9]{13}" 
				   style="height:45px; width:210px; text-align:center;"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email" id="email" style="text-align:center;">@
			<select name="email2" id="email2" style="width:180px">
				<option value="">직접 입력</option>
				<option value="@naver.com">naver.com</option>
				<option value="@google.com">google.com</option>
				<option value="@hanmail.net">hanmail.net</option>
				<option value="@daum.net">daum.net</option>
				<option value="@nate.com">nate.com</option>
				<option value="@yahoo.com">yahoo.com</option>
				
			</select>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2"><textarea rows="4" cols="40" name="address" id="address" style="height:50px; width:300px; text-align:center;"></textarea></td>
	</tr>
	<tr>
		<td colspan="3" align="center" class="submit"><input type="submit" value="가입" style="height:30px; width:100px;"></td>
	<tr>

</table>
</form>
</div>

</body>
</html>