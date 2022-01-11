<%@page import="models.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
<%
ReviewDTO review = (ReviewDTO)request.getAttribute("review");

String userName = "Guest";
if(session.getAttribute("user") != null) 
	userName = String.valueOf(session.getAttribute("user"));
%>

<div id="before">
	<table>
		<tr><th> 수정 전 리뷰 </th></tr>
    	<tr><td>리뷰 국가 : <%=review.getCountryName() %></td>
    	<td>유저 이름 : <%=review.getUserName() %></td>
    	<td>평가 점수 : <%=review.getScore() %> 점</td></tr>
   		<tr><td colspan="3">유저 리뷰 : <%=review.getContent()%></td></tr>
    	<tr><td colspan="2">리뷰 날짜 : <%=review.getDate() %></td></tr>
    </table>
</div>

<div id="after">
        	<form method="post" action="service">
        		<table>
        			<tr>
        				<th> 리뷰 수정하기 </th>
        			</tr>
        			<tr>
        				<td>
        					<input id="range" type="range" min=1 max=10 value=5 name="score"><span id="child">5점</span>
        				</td>
        			</tr>
        			<tr>
        				<td> <textarea name="content" placeholder="내용"></textarea> </td>
        			</tr>
        			<tr>
        				<td>
        					<%
        						if(userName.equals("Guest")) {
        							%>
        								<input name="pw" type="password" placeholder="비밀번호" required>
        							<%
        						}
        					%>
        					<input type="submit" value="댓글 적기">
        				</td>
        			</tr>
        		</table>
        		<input type="hidden" name="countryName" value=<%=review.getCountryName() %>>
        		<input type="hidden" name="userName" value=<%=userName %>>
        		<input type="hidden" name="command" value="modifyReviewSubmit">
        	</form>
</div>

<%
%>
</body>
</html>