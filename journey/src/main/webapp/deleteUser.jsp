<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="css/deleteUser.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
  <div>
        <header>
            <div class="top">
                <ul class="top-menu">
                     <%
            	if(session.getAttribute("log") == null){
            %>
				<li class="join"><a href="service?command=join">
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
                <li><a href="">마이페이지</a></li>
            </ul>
        </nav>
        <main>
            <aside class="mypage">
                <p id="mypage">마이페이지</p>
                <ul>
                    <li><a href="">회원정보 수정</a></li>
                    <li><a href="">내가 쓴 리뷰</a></li>
                    <li><a href="">회원탈퇴</a></li>
    
                </ul>
    
            </aside>
            <div>
                <article class="info">
                    <p>＊회원탈퇴</p>
                    <form action="service">
                      
                       <span>Id:</span><input type="text"><br><br>
                        <span>Pw:</span><input type="text"><br><br>
                    <div><input type="submit" value="회원탈퇴" ></div> 
                     <input type="hidden" name="command" value="deleteUser">  
                </form>
                
                </article>
            </div>
        </main>
       
    
        <footer>
            <p> Copyright © TravelCommunity. All Rights Reserved.</p>
        </footer>
    </div>
</body>
</html>