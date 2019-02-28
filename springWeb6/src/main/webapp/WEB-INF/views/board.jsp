<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script>
function formSubmit(page){
	var form = document.getElementById('pagingForm'); //검색폼
	var page = document.getElementById('page');		  //히든항목
	page.value = page;	 							  //page에 바로바로 value값 대입시키기
	form.submit();
}
</script>

<link href="resources/css/board.css" rel="stylesheet" type="text/css">
<script src="resources/js/js.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>


</head>
<body>
<div>
<span><a href="./"><img width="200" height="60" src="resources/image/NEWGAVER.png"></a></span>
<span style="font-size: 30px; text-align:center; align:center; text-weight:30px; color:white;" >　　　　　　　　　FREE BOARD</span>
<c:if test="${id!=null}"><!-- 로그인 한 상태면 개인정보 수정, 로그아웃을 게시판 상단에 띄움 -->
<span>　　　　　　　　　　　　　　　　　　　　${id}</span>
<span><a href="infoUpdate"><input type="button" value="개인정보 수정"></a></span>
<span><a href="logout"><input type="button" value="로그아웃"></a></span>
</c:if>
	<table align="center">
		<tr><td>　</td></tr>
		<tr><td>　</td></tr>
		<tr>
			<th colspan="6">　　　글번호　　　　　　　　　　　　　　　　　　
			제목　　　　　　　　　　　　　　　　
			작성자　　　
			조회수　　　　
			&nbsp;작성일　　</th>
		</tr>
		<c:if test="${board.size()>0}">
			<c:forEach var="i" begin="0" end="${board.size()-1}">
			<tr>
				<td style="width:50px;"><p>${board.get(i).getBoardnum()}</p></td>
				<td style="width:500px;"><a href="content?boardnum=${board.get(i).getBoardnum()}"><p>${board.get(i).getTitle()}</p></a></td>
				<td style="width:100px;"><p>${board.get(i).getId()}</p></td>
				<td style="width:100px;"><p>${board.get(i).getHits()}</p></td>
				<td style="width:150px;"><p>${board.get(i).getInputdate()}</p></td>
			</tr>
			</c:forEach>
		</c:if>
		<tr><!-- 페이징 행 부분 -->
			<td class = "tale" colspan = "6" height="30px">
		<!-- 띄어쓰기 시작 -->
		　　　　　　　　　　　　　　	　　　　
		<!-- 띄어쓰기 끝 -->
		<!-- 페이지 이동 부분 -->
									<!-- "◁◁ " 현재 페이지 - 그룹당 페이지 수 -->
			<%--<a href="javascript:formSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;--%>
			 <a href="board?page=${navi.currentPage - navi.pagePerGroup}">◁◁ </a> &nbsp;&nbsp; 
									<!-- "◀" 현재 페이지-1 -->
			<%--<a href="javascript:formSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;--%>
			 <a href="board?page=${navi.currentPage - 1}">◀</a> &nbsp;&nbsp; 
											<!-- 현재 그룹의 첫 페이지				현재 그룹의 마지막 페이지 -->
			<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
								<!--  -->
				<c:if test="${counter == navi.currentPage}"></c:if>
					<a href="board?page=${counter}">${counter}</a>&nbsp;
					<%-- <a href="javascript:formSubmit(${counter})">${counter}</a>&nbsp;  --%>
				<c:if test="${counter == navi.currentPage}"></c:if>
			</c:forEach>
			&nbsp;&nbsp;
			<%-- <a href="javascript:formSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp; --%>
			<a href="board?page=${navi.currentPage + 1}">▶</a> &nbsp;&nbsp;
			<%-- <a href="javascript:formSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a> --%>
			<a href="board?page=${navi.currentPage + navi.pagePerGroup}">▷▷</a>
		<!-- 글쓰기 버튼 부분 -->
		<c:if test="${id!=null}">	　　　　　　　　　　　　　　
			<a href="write"><input type="button" value="글쓰기" style="background-color:white;"></a>
		</c:if>	
			</td>
		<!-- /페이지 이동 끝 -->
		</tr>
		<tr><td colspan="6">　</td></tr>
		<tr><!-- 검색기능 들어있는 행 -->
			<td colspan="6">
		<!-- 검색 기능(GET방식> -->	
		
				<form id="pagingForm" action="board" method="get">
				<select id="op" name="op" style="height:22px;">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>									<!-- 1차 검색후 검색내용이 남아있도록 -->
				<input type="text" id="search" name="search" value="${search}">
				<!-- 페이지 번호 같이 보내기 -->
				<input type="hidden" id="page" name="page" value="1">
													<!-- 검색 이후 목록도 1페이지부터 시작하도록 -->
				<input type="submit" value="검색" onclick="formSubmit(1)" style="background-color:white;">
				</form>
		<!-- 검색 기능 끝 -->
		<!-- 검색 결과 출력후 '목록보기'창 보이기 -->	
			<c:if test="${search_check == 'checked'}">
				<a href="board"><input type="button" value="목록보기" style="background-color:white;"></a>
			</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>