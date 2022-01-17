<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
</head>
<body>
<header>
        <div class="top">
            <ul class="top-menu">
                <%
            	if(session.getAttribute("log") == null){
            %>
				<li class="join"><a href="join.jsp">
						<p>회원가입</p>
				</a></li>
				<li class="join"><a href="login.jsp">
						<p>로그인</p>
				</a></li>
				<%
           		 }else{
           	%>
				<li class="join"><a href="mypage.jsp">
						<p>마이페이지</p>
				</a></li>
				<li class="join"><a href="service?command=logout">
						<p>로그아웃</p>
				</a></li>
				<% }
      		%>
            </ul>
        </div>
        <h1 id="title"><a href="main.jsp">Travel Community</a></h1>
    </header>
    <nav>
        <ul>
            <li><a href="viewCountry.jsp">국가 정보</a></li>
<!--             <li><a href="">게시판</a></li> -->
<!--             <li><a href="">공지사항</a></li> -->
        </ul>
    </nav>
</body>
</html>