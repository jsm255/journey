<%@page import="controllers.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.ReReviewDTO"%>
<%@page import="controllers.ReReviewDAO"%>
<%@page import="models.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.ReviewDAO"%>
<%@page import="models.CountryDTO"%>
<%@page import="controllers.CountryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/viewCountry.css" type="text/css">

<style>
	@charset "UTF-8";

@charset "UTF-8";

@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

body{
	height: 80vh;
}

main{
    grid-area: main;
    height: 100vh;
    margin-left: 2%;
    margin-top: 3%;
}

aside{
    width: 15%;
    float: left;
    height: 100vh;
    margin-right: 3%;
   
}
.country{
    text-align: center;
    border: 1px solid black;
    border-radius: 10px;
}

.country ul{
    list-style: none;

}

.country ul li{
    margin: 10% 0 10% 0;
    font-size: 18pt;
    color: black;
}

.contents{
	width: 70%;
}

table{
	width: 70%;
}

input[type="button"]{
    font-size: 15pt;
    text-align: center;
    width: 6vw;
    margin-left: 53%;
    background-color: transparent;
    border-radius: 5px;
    cursor: pointer;
}

img{
  	width: 250px;
   	height: 175px;
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

footer{
	margin-top : 58vh;
	display:block;
	width:100%;
	position:fixed;
	bottom:0;
	
}

div#review a:link {
	color : blue;
}
div#review a:visited {
	color : orange;
}

div#countryInfo table{
	width: 50%;
}

div#writeReview table{
	width: 50%;
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

// 로그인 method post로 바꾸기


String countryName = "미국";
if(request.getParameter("countryName") != null)
	countryName = request.getParameter("countryName");
System.out.println(countryName);

String id = "Guest";
if(session.getAttribute("log") != null) {
	id = String.valueOf(session.getAttribute("log"));
}

UserDAO uDao = UserDAO.getInstance();

CountryDAO cDao = CountryDAO.getInstance();
CountryDTO country = cDao.getCountry(countryName);
country.setScore(cDao.setCountryScore(countryName)); // ====>>>>> 이거 수정하는게 좋겠음, 요청이 너무 많다고 리턴을 못해줌
String flag = country.getFlag();

%>
<title>정보</title>
</head>
<body>
	   <c:import url="header.jsp"/>
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
        
        <div id="contents">
        	<div id="countryInfo">
        	<table>
        	<tr>
                <td id="flagTd" rowspan="4">
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
                <td><span>국가 이름 : </span><%=country.getCountryName() %></td>
            </tr>
            <tr>
                <td><span>리뷰 평균 : </span><%=country.getScore() %> 점</td>
            </tr>
            <tr>
                <td><%=country.getContent() %></td>
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
        		<%
        		if(!id.equals("Guest")) {
        			%>
        			<input type="hidden" name="userCode" value=<%=uDao.getUserCodeById(id) %>>
        			<%
        		}
        		%>
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
        			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        		
        			for(int i = reviewStart; i<=reviewEnd; i++) {
            			ReviewDTO temp = reviews.get(i);
            			String date = sdf.format(reviews.get(i).getDate());
            			%>
            			<tr><td>
            				<table>
            					<tr><td>리뷰 국가 : <%=temp.getCountryName() %></td>
            					<td>유저 이름 : <%=temp.getId() %></td>
            					<td>평가 점수 : <%=temp.getScore() %> 점</td></tr>
            					<tr><td colspan="3">유저 리뷰 : <%=temp.getContent()%></td></tr>
            					<tr><td colspan="2">리뷰 날짜 : <%=date %></td>
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
            							date = sdf.format(rrtemp.getDate());
	            					%>
	            					<tr><td><span>&#9;</span>유저 이름 : <%=rrtemp.getId() %></td></tr>
            						<tr><td><span>&#9;</span>유저 답글 : <%=rrtemp.getContent()%></td></tr>
            						<tr><td><span>&#9;</span>답글 날짜 : <%=date %></td></tr>
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
        </div>
        
    </main>
<%--     <c:import url="footer.jsp"/> --%>
    

<script type="text/javascript" src="viewCountry.js"></script>
    
</body>
</html>