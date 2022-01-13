<%@page import="models.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	textarea{
		width: 300px;
		height: 100px;
		resize: none;
	}
</style>

<title>답글 적기</title>
</head>
<body>
<%
ReviewDTO review = null;
if(session.getAttribute("review") instanceof ReviewDTO) {
	review = (ReviewDTO)session.getAttribute("review");
}
String userName = "Guest";
if(session.getAttribute("log") != null) {
	userName = String.valueOf(session.getAttribute("log"));
}
%>
<table>
	<tr><th> 답글을 적을 댓글 </th></tr>
	<tr><td>리뷰 국가 : <%=review.getCountryName() %></td>
    <td>유저 이름 : <%=review.getUserName() %></td>
    <td>평가 점수 : <%=review.getScore() %> 점</td></tr>
   	<tr><td colspan="3">유저 리뷰 : <%=review.getContent()%></td></tr>
    <tr><td colspan="2">리뷰 날짜 : <%=review.getDate() %></td></tr>
</table>

<form method="post" action="service">
<table>
	<tr><th> 답글 작성 </th></tr>
	<tr><td> <textarea name="content" placeholder="내용을 적으세요" required></textarea> </td></tr>
	<%
	if(userName.equals("Guest")) {
		%>
		<tr><td><h3>글에 대한 비밀번호를 기억해둬야 <br>수정 및 삭제가 가능합니다.</h3></td></tr>
		<tr><td><input type="password" name="pw" placeholder="답글의 비밀번호" required></td></tr>
		<%
	}
	%>
	<tr><td><input type="submit" value="답글 작성"></td></tr>	
</table>
	<input type="hidden" name="command" value="writeReReview">
	<input type="hidden" name="additional" value="written">
	<input type="hidden" name="code" value=<%=review.getCode() %>>
	<input type="hidden" name="userName" value=<%=userName %>>
</form>
</body>
</html>