<%@page import="java.util.ArrayList"%>
<%@page import="models.BlogDTO"%>
<%@page import="controllers.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/viewBlogDetail.css" type="text/css">
<%
int code = Integer.parseInt(request.getParameter("code"));

BlogDAO bDao = BlogDAO.getInstance();
BlogDTO blog = bDao.getBlog(code);
%>
<title>블로그 글 보기 - <%=blog.getTitle() %></title>
</head>
<body>
	   <c:import url="header.jsp"/>
	   <main>
	   <table>
			<tr>
				<th colspan=3>제목 : <%=blog.getTitle() %></th>
			</tr>
			<tr>
				<td>국가 : <%=blog.getCountryName() %></td>
				<td>작성자 : <%=blog.getId() %></td>
				<td>점수 : <%=blog.getScore() %> 점</td>
			</tr>
			
			<%
			ArrayList<String> images = blog.getImages();
			if(images.size() != 0) {
				%>
				<tr>
					
					<%
						for(int i = 0; i<images.size(); i++) {
							%><td>
								<img src=<%=images.get(i) %>>
							</td><%
						}
					%>
					
				</tr>
				<%
			}
			
			%>
			<tr>
				<td id="content" colspan=3><%=blog.getContent() %></td>
			</tr>
			<tr>
				<td colspan=3>작성 날짜 : <%=blog.getDate() %></td>
			</tr>
			
		</table>
	   </main>

</body>
</html>