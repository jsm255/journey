<%@page import="controllers.UserDAO"%>
<%@page import="models.UserDTO"%>
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
                <li><a href="">게시판</a></li>
                <li><a href="mypage.jsp">마이페이지</a></li>
            </ul>
        </nav>
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
                      
                       <span>Id:</span><input type="text" name="id" value="<%=user.getId()%>" readonly><br><br>
                        <span>Pw:</span><input type="text" name="pw"><br><br>
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
<%
	}
%>