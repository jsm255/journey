<%@page import="java.util.ArrayList"%>
<%@page import="models.UserDTO"%>
<%@page import="controllers.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/mypageMain.css" type="text/css">
<link rel="stylesheet" href="css/all.css" type="text/css">
<title>Insert title here</title>
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
		
		ArrayList<String> likes = new ArrayList<>();
		
		%>
	<div>
		<c:import url="header.jsp" />
		<main>
			<aside class="mypage">
				<p id="mypage">마이페이지</p>
				<ul class="myList">
					<li><a href="mypageMain.jsp">좋아요 표시한 국가</a></li>
					<li><a href="mypage.jsp">회원정보 수정</a></li>
					<li><a href="myboardList.jsp">내가 작성한 리뷰</a></li>
					<li><a href="deleteUser.jsp">회원 탈퇴</a></li>

				</ul>

			</aside>
			<div>
				<article class="like">
					<p>＊좋아요 표시한 국가</p>
						<table>
						<%
						if(likes.size() == 0) {
							%>
							<tr><td> 아직 좋아요 표시한 국가가 없습니다! </td></tr>
							<tr><td> 국가 정보 게시판을 둘러보시고 좋아요 표시를 눌러보세요! </td></tr>
							<%
						}
						else {
							
						}
						%>
				</article>
			</div>
		</main>
		<div class="footer-div" >
        <c:import url="footer.jsp"/>
        </div>
		<script type="text/javascript" src="validation.js"></script>
	</div>
	<%
	}
	%>
</body>
</html>