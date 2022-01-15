<%@page import="controllers.UserDAO"%>
<%@page import="models.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/deleteUser.css" type="text/css">
<link rel="stylesheet" href="css/all.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%
	if(session.getAttribute("log") == null){
		response.sendRedirect("login.jsp?error=needLogin");
	}
	else{

	String id = (String) session.getAttribute("log");
	UserDTO user = UserDAO.getInstance().getId(id);
	System.out.println("id:"+id);

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
					<p>＊회원탈퇴</p>
					<form action="service" method="post">

						<span>Id:</span><input type="text" name="id"
							value="<%=user.getId()%>" readonly><br>
						<br> <span>Pw:</span><input type="text" name="pw"><br>
						<br>
						<div>
							<input type="submit" value="회원탈퇴">
						</div>
						<input type="hidden" name="command" value="deleteUser">
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