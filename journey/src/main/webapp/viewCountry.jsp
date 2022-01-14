<%@page import="models.ReReviewDTO"%>
<%@page import="controllers.ReReviewDAO"%>
<%@page import="models.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.ReviewDAO"%>
<%@page import="models.CountryDTO"%>
<%@page import="controllers.CountryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet" href="css/viewCountry.css" type="text/css">


	<style>
        body{
            display: grid;

            width: 100vw;
            height: 100vh;

            grid-template-columns: 100%;
            grid-template-rows: 15% 15% 60% 10%;
            grid-template-areas: 
            "header"
            "nav"
            "main"
            "footer"
            ;
        }

        header{
            grid-area: header;
        }

        nav{
            grid-area: nav;
        }

        main{
            grid-area: main;
        }

        footer{
            grid-area: footer;
        }
        
        img{
        	width: 250px;
        	height: 175px;
        }
        
        td{
        }
        
        div#writeReview textarea{
        	width: 500px;
        	height: 200px;
        	resize: none;
        }
        
        span{white-space:pre;}
        
        div#writeReview input {
        	width: 200px;
        	height: 35px;
        }
    </style>

<%
// Guest 이름으로 된 댓글은 로그인을 했든 안했든 수정/삭제가 보임	=> 당연히 비밀번호를 씀
// 어떤 댓글을 눌렀는지에 대한 검증이 필요함 => 버튼에 id를 달아놓으면 되겠다
// 비밀번호 검증을 해야한다.

// 국가에 대한 정보를 좀 더 넣는게 낫겠다
// 더미데이터나 api를 사용해서 넣으면 더 좋겠음

// 22 01 13 한 일 : 답글 삭제 보완(완료), 답글 작성(완료), 답글 수정(완료)
// 22 01 14 할 일 : 국가 평점 평균 내서 보여주기 / css

// jsp페이지를 모바일 css 먹일 생각하면서 만들어야함

String countryName = "미국";
if(request.getParameter("countryName") != null)
	countryName = request.getParameter("countryName");

String id = "Guest";
if(session.getAttribute("user") != null) {
	id = String.valueOf(session.getAttribute("user"));
}

CountryDAO cDao = CountryDAO.getInstance();
CountryDTO country = cDao.getCountry(countryName);
country.setScore(cDao.setCountryScore(countryName));
String flag = country.getFlag();
%>
<title>정보</title>
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
            <li><a href="">게시판</a></li>
            <li><a href="mypage.jsp">마이페이지</a></li>
        </ul>
    </nav>
    
    <main>
        <aside class="country">
            <p id="country">국가 목록</p>
            <ul>
                <li><a href="viewCountry.jsp?countryName=미국">미국</a></li>
                <li><a href="viewCountry.jsp?countryName=영국">영국</a></li>
                <li><a href="viewCountry.jsp?countryName=일본">일본</a></li>
                <li><a href="viewCountry.jsp?countryName=태국">태국</a></li>
                <li><a href="viewCountry.jsp?countryName=중국">중국</a></li>
                <li><a href="viewCountry.jsp?countryName=필리핀">필리핀</a></li>
                <li><a href="viewCountry.jsp?countryName=독일">독일</a></li>
                <li><a href="viewCountry.jsp?countryName=이탈리아">이탈리아</a></li>
                <li><a href="viewCountry.jsp?countryName=그리스">그리스</a></li>
                <li><a href="viewCountry.jsp?countryName=인도">인도</a></li>
            </ul>
        </aside>
        
        <div id="country">
        	<table>
        	<tr>
                <td rowspan="4">
					<%
						if(flag.compareTo("") != 0) {
							%>
								<img src=<%=flag %>>
							<%
						}
						else {
							%>
								<img src="images/question.png">
							<%
						}
					%>
				</td>
            </tr>
            <tr>
                <td><%=country.getCountryName() %></td>
            </tr>
            <tr>
                <td><%=country.getScore() %> 점</td>
            </tr>
            <tr>
                <td><!-- 맛집, 여행, 비행기 표 연동 --></td>
            </tr>
        	</table>
        </div>
        <!-- 리뷰 쓰기 시스템을 넣을 것임 -->
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
        		<input type="hidden" name="command" value="writeReview">
        	</form>
        </div>
        <div id="review">	<!-- 10개까지 표시 + 작성 창 => 11줄 / 답글 -->
        	<table>
        	<%
        		ReviewDAO rDao = ReviewDAO.getInstance();
        		ReReviewDAO rrDao = ReReviewDAO.getInstance();
        		ArrayList<ReviewDTO> reviews = rDao.getReviews(countryName);
        			int currentPage = 1;
        			if(request.getParameter("currentPage") != null) {
        				currentPage = Integer.parseInt(request.getParameter("currentPage"));
        			}
        			int reviewStart = (currentPage-1)*10;
        			int reviewEnd = reviewStart+9 > reviews.size()-1 ? reviews.size()-1 : reviewStart+9;
        			int pageStart = (((currentPage-1)/10) * 10) + 1;
        			int pageEnd= (pageStart+9)*10 > reviews.size() ? ((reviews.size()-1)/10)+1 : pageStart+9;
        			int lastPage = ((reviews.size() - 1) / 10) + 1;
        			
        			for(int i = reviewStart; i<=reviewEnd; i++) {
            			ReviewDTO temp = reviews.get(i);
            			%>
            			<tr><td>
            				<table>
            					<tr><td>리뷰 국가 : <%=temp.getCountryName() %></td>
            					<td>유저 이름 : <%=temp.getId() %></td>
            					<td>평가 점수 : <%=temp.getScore() %> 점</td></tr>
            					<tr><td colspan="3">유저 리뷰 : <%=temp.getContent()%></td></tr>
            					<tr><td colspan="2">리뷰 날짜 : <%=temp.getDate() %></td>
            					<td>
            					<button onclick="location.href='service?command=writeReReview&code=<%=temp.getCode()%>'">답글</button>
            					<%
            					if(temp.getId().equals("Guest") && temp.getId().equals(id)) {
            						%>
                					<button onclick="location.href='service?command=modifyReview&code=<%=temp.getCode()%>'">수정</button>
                					<button onclick="location.href='service?command=deleteReview&code=<%=temp.getCode()%>'">삭제</button>
                					<%
            					}
            					else if(temp.getId().equals(id)) {
            						%>
            						<button onclick="location.href='service?command=modifyReview&code=<%=temp.getCode()%>'">수정</button>
                					<button onclick="location.href='service?command=deleteReview&code=<%=temp.getCode()%>'">삭제</button>
            						<%
            					}
            					
            					%>
            					</td></tr>
            					<%
            					if(temp.getAttachCnt() >= 1) {
            						%>
            						<tr><td><button id="<%=temp.getCode() %>" onclick='toggleTable(event)'>답글 <%=temp.getAttachCnt() %>개 보기</button></td></tr>
            						<tr><td colspan="3"><table id="<%=temp.getCode() %>_table" style="display:none;">
            						<%
            						ArrayList<ReReviewDTO> rrviews = rrDao.getReReviews(temp.getCode());
            						for(ReReviewDTO rrtemp : rrviews) {
	            					%>
	            					<tr><td><span>&#9;</span>유저 이름 : <%=rrtemp.getId() %></td></tr>
            						<tr><td><span>&#9;</span>유저 답글 : <%=rrtemp.getContent()%></td></tr>
            						<tr><td><span>&#9;</span>답글 날짜 : <%=rrtemp.getDate() %></td></tr>
            						<tr><td><span>&#9;</span>
            						<%
            						if(rrtemp.getId().equals("Guest") && rrtemp.getId().equals(id)) {
            							%>
                						<button onclick="location.href='service?command=modifyReReview&code=<%=rrtemp.getCode()%>&countryName=<%=countryName%>'">수정</button>
                						<button onclick="location.href='service?command=deleteReReview&code=<%=rrtemp.getCode()%>&countryName=<%=countryName%>'">삭제</button>
                						<%
            						}
            						else if(rrtemp.getId().equals(id)) {
            							%>
            							<button onclick="location.href='service?command=modifyReReview&code=<%=rrtemp.getCode()%>&countryName=<%=countryName%>'">수정</button>
                						<button onclick="location.href='service?command=deleteReReview&code=<%=rrtemp.getCode()%>&countryName=<%=countryName%>'">삭제</button>
            							<%
            						}
            					
            					%>
            					</td></tr>
	            					<%
            						}
            					%>
	            				</table>
            					</td></tr>
            					<%
            					}
            				%>
            				</table>
            				</td></tr>
            				<%
            			}
        			%>
        			<tr><td>
        			<%
        			if(pageStart != 1) {
        				int targetPage = currentPage-10;
        				if(targetPage < 1) targetPage = 1;
        				%>
        				<button onclick="location.href='viewCountry.jsp?countryName=<%=countryName %>&currentPage=<%= targetPage %>'">이전 10페이지</button>
        				<%
        			}
        			for(int i = pageStart; i<=pageEnd; i++) {
        				if(currentPage == i) {
        					%>
        					<span>[<%=i %>] </span>
        					<%
        				}
        				else {
        					%>
    						<a href="viewCountry.jsp?countryName=<%=countryName %>&currentPage=<%= i %>">[<%=i %>] </a>
    						<%
        				}
        			}
        			
        			if((pageStart+10) * 10 <= reviews.size()) {
        				int targetPage = currentPage+10;
        				if(targetPage >= lastPage) targetPage = lastPage;
        				%>
        				      <button onclick="location.href='viewCountry.jsp?countryName=<%=countryName %>&currentPage=<%= targetPage %>'">이후 10페이지</button>
        				<%
        			}
        			
        			%>
        			</td></tr>
        	
        	</table>
        </div>
    </main>
    <footer>
        <p> Copyright © TravelCommunity. All Rights Reserved.</p>
    </footer>
    

<script type="text/javascript" src="viewCountry.js"></script>
    
</body>
</html>