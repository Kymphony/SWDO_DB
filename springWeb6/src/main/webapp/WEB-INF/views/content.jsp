<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/content.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 읽기</title>
</head>
<body>

<div align="center">
	<h1 align="center">FREE BOARD</h1>
	<table align="center">
		<tr><td>　</td></tr>
		<tr>
				<th class="1" style="width:50px;" style="text-align:center;">글번호: ${content.getBoardnum()}</th>
				<th class="2"style="width:400px;" style="text-align:center;">제목: ${content.getTitle()}</th>
				<th class="3"style="width:450px;" style="text-align:center;">작성자: ${content.getId()}　　　　조회수: ${content.getHits()}　　작성일: ${content.getInputdate()}</th>
		</tr>
		<tr>
			<td class="content" colspan="3"><p>${content.getContent()}</p></td>
		</tr>
	<!-- 첨부된 파일이 있으면 다운로드 되도록 -->
		<tr><td colspan="3" style="background: white; text-align: center; color:black;">
			<c:if test="${content.originalfile != null}">
				첨부파일 : <a href="download?boardnum=${content.boardnum}">${content.originalfile}</a>
			</c:if>
		</td></tr>
		<tr>
			<td colspan="3">
				<br>
				<a href="board"><input type="button" value="목록 보기" style="width: 120px; height: 50px;"></a>
				<c:if test="${id==content.getId()}"><!-- 자기 글만 삭제, 수정 가능하도록 -->
				<a href="contentUpdate?boardnum=${content.getBoardnum()}"><input type="button" value="수정 " style="width: 120px; height: 50px;"></a>
				<a href="contentDelete?boardnum=${content.getBoardnum()}"><input type="button" value="삭제" style="width: 120px; height: 50px;"></a>
				</c:if>
			</td>
		</tr>
	</table>
	<br><br><br><br>
<!-- 댓글창 -->	
	<table>
	<c:if test="{id!=null}">
		<tr><td class="replyhead" colspan="3" align="center">댓글</td></tr>
		<tr><td>　</td></tr>
	</c:if>
	<!-- 댓글 내용 출력 -->
		<c:if test="${reply.size()>0}">
		<tr>
				<th class="id"	 style="text-align:center; width:100px;">작성자</th>
				<th class="text" style="text-align:center; width:600px;">내용</th>
				<th class="date" style="text-align:center; width:200px;">입력일</th>
		</tr>
		<c:forEach var="i" begin="0" end="${reply.size()-1}">
			<tr>
				<td>${reply.get(i).getId()}</td>
				<td>${reply.get(i).getText()}</td>
				<td>${reply.get(i).getInputdate()}</td>	
			</tr>
		</c:forEach>
		</c:if>
	<!--  -->
	<!-- 댓글이 없는 글일때 -->
		<c:if test="${reply.size()<1}">
			<tr><td colspan="3">　</td></tr>
			<tr><td colspan="3">　</td></tr>	
			<tr><td colspan="3">　</td></tr>
			<tr><td colspan="3">댓글이 없습니다</td></tr>
			<tr><td colspan="3">　</td></tr>
			<tr><td colspan="3">　</td></tr>
			<tr><td colspan="3">　</td></tr>
		</c:if>
	<!-- / -->
	<!-- 댓글 입력란 -->
	<c:if test="${id != null}"><!-- 로그인 시에만 보이게 하기 -->
		<tr><td colspan="3">　</td></tr>
		<tr>
			<td class="tale" colspan="3" style="width:900px;">
				<form action="reply" method="post">
					<input type="hidden" id="id" name="id" value="${id}">
					<input type="hidden" id="boardnum" name="boardnum" value="${content.getBoardnum()}">
					<input type="text" id="text" name="text" 
						placeholder="댓글 입력" style="width:500px; height:30px; text-align:center;">
					<input type="submit" value="입력" style="height:30px;">
				</form>
			</td>
		</tr>
	</c:if>
	</table>
</div>
</body>
</html>