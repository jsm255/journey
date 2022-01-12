<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>MAIN</title>
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
				<li class="join"><a href="">
						<p>로그아웃</p>
				</a></li>
				<% }
      		%>
            </ul>
        </div>
        <h1 id="title"><a href="">Travel Community</a></h1>
    </header>
    <nav>
        <ul>
            <li><a href="">국가 정보</a></li>
            <li><a href="">게시판</a></li>
            <li><a href="mypage.jsp">마이페이지</a></li>
        </ul>
    </nav>
    <div class="image">
     <main>
        <h1 class="mainTitle">어디로 떠나실건가요?</h1>
        <form action="get" method="service">
        <select size="1" class="country" name="country">
        
            <option value="미국">미국</option>
            <option value="영국">영국</option>
            <option value="일본">일본</option>
            <option value="태국">태국</option>
            <option value="중국">중국</option>
            <option value="필리핀">필리핀</option>
            <option value="독일">독일</option>
            <option value="이탈리아">이탈리아</option>
            <option value="그리스">그리스</option>
            <option value="인도">인도</option>
        </select>
        <input type="button" onclick="" >
       	<input type="hidden" name="command">
        </form>
    </main>
    <footer>
        <p> Copyright © TravelCommunity. All Rights Reserved.</p>
    </footer>
</div>
</body>
</html>