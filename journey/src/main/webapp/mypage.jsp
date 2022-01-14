<%@page import="models.UserDTO"%>
<%@page import="controllers.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<link rel="stylesheet" href="css/all.css" type="text/css">
<title>Mypage</title>
</head>
<body>
	<%
	if(session.getAttribute("log") == null) {
		response.sendRedirect("login.jsp?error=needLogin");
	}
	else {
		String id = (String) session.getAttribute("log");
		UserDTO user = UserDAO.getInstance().getId(id);
		// System.out.println("id:"+id);
		
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
				<article class="info">
					<p>＊회원정보 수정</p>
					<form action="service" method="post">
						<table border="1px solid black">
							<tr>
								<th>이름</th>
								<td><input type="text" name="name"
									value="<%=user.getUserName()%>" readonly></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" value="<%=user.getId()%>"
									readonly></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="tel"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="<%=user.getTel()%>"></td>
							</tr>
							<tr>
								<th>비밀번호 변경</th>
								<td><input type="password" name="pw"
									value="<%= user.getPw()%>"></td>
							</tr>
						</table>
						<div>
							<input type="submit" value="수정">
						</div>
						<input type="hidden" name="command" value="mypage">
					</form>
				</article>
			</div>
		</main>
		<c:import url="footer.jsp" />
	</div>
</body>
</html>
<%
	}
%>

