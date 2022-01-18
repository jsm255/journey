<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/all.css" type="text/css">

<title>블로그 글 보기</title>
</head>

<body>
<%
String countryName = "미국";
if(request.getParameter("countryName") != null)
	countryName = request.getParameter("countryName");
System.out.println(countryName);

String id = "Guest";
if(session.getAttribute("log") != null) {
	id = String.valueOf(session.getAttribute("log"));
}

UserDAO uDao = UserDAO.getInstance();

CountryDAO cDao = CountryDAO.getInstance();
CountryDTO country = cDao.getCountry(countryName);
country.setScore(cDao.setCountryScore(countryName));
String flag = country.getFlag();
%>

	<c:import url="header.jsp" />
	<div>
	<input type  ="hidden" name = "command" value = "">
	
		<input type="text" name="contryName" id="contryName"/>
		
		<input type = "range" name = "score" id = "score" />
		
		<input type = "text" name = "headText" id = "headText" >
		
		<input type = "text" name = "bodyText" id = "bodyText">
		
	</div>

<div id="writeReview">
        	<form method="post" action="service">
        		<table>
        			<tr>
        				<th> 리뷰 쓰기 </th>
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
        						if(id.equals("Guest")) {
        							%>
        								<input name="pw" type="password" placeholder="비밀번호" required>
        							<%
        						}
        					%>
        					<input type="submit" value="댓글 적기">
        				</td>
        			</tr>
        		</table>
        		<input type="hidden" name="countryName" value=<%=countryName %>>
        		<input type="hidden" name="id" value=<%=id %>>
        		<%
        		if(!id.equals("Guest")) {
        			%>
        			<input type="hidden" name="userCode" value=<%=uDao.getUserCodeById(id) %>>
        			<%
        		}
        		%>
        		<input type="hidden" name="command" value="writeReview">
        	</form>
        </div>

</body>
</html>