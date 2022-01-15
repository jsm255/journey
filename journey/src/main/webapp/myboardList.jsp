<%@page import="java.util.ArrayList"%>
<%@page import="models.ReviewDTO"%>
<%@page import="controllers.ReviewDAO"%>
<%@page import="controllers.UserDAO"%>
<%@page import="models.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/myboardList.css">
<link rel="stylesheet" href="css/all.css" type="text/css">
<title>boardList</title>
</head>
<body>
	<%
	String reviewId = (String) session.getAttribute("log");
	UserDTO user = UserDAO.getInstance().getId(reviewId);
	
	
	ReviewDAO dao = ReviewDAO.getInstance();
	ArrayList<ReviewDTO> review = dao.getMyBoardList(reviewId);
	System.out.println("reviewId: "+reviewId);
%>
	<div>
		<c:import url="header.jsp" />
		<main>
			<aside class="mypage">
				<p id="mypage">마이페이지</p>
				<ul>
					<li><a href="mypage.jsp">회원정보 수정</a></li>
					<li><a href="myboardList.jsp">내가 작성한 리뷰</a></li>
					<li><a href="deleteUser.jsp">회원탈퇴</a></li>

				</ul>

			</aside>
			<div>
				<article class="review">
					<p>＊내가 작성한 리뷰</p>

					<table border="1px solid">
						<tr>
							<td>No</td>
							<td>Country</td>
							<td>Id</td>
							<td>Content</td>
							<td>Date</td>
						</tr>
						<%
                  for(int i=0; i<review.size(); i++){
                	  
                  %>
						<tr>
							<td><%=review.get(i).getCode()%></td>
							<td><a
								href="viewCountry.jsp?code=<%=review.get(i).getCode()%>"><%=review.get(i).getCountryName() %></a></td>
							<td><%=review.get(i).getId() %></td>
							<td><%=review.get(i).getContent() %></td>
							<td><%=review.get(i).getDate()%></td>
						</tr>
						<%} %>
					</table>
					<form action="service" method="post">
					<input type="hidden" name="command" value="myBoardList">
					</form>
				</article>
			</div>
		</main>
		<c:import url="footer.jsp" />
	</div>
</body>
</html>