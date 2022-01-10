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
<script type="text/javascript" src="viewCountry.js"></script>

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
        
        textarea{
        	resize: none;
        }
        
        span{white-space:pre;}
    </style>

<%

// user 처리가 어떻게 되는지 물어봐야함
// 대댓글 처리는 원래 댓글에는 대댓글이 몇 개 있는지 기록	(테이블 설정 갱신 필요(새로 대댓글 개수 카운터를 만들어줘야함))	- 끝
// database에 새로 reReview를 만들어서 대댓글을 저장 및 조회할 수 있게함										- 끝
// 대댓글에는 이 대댓글이 어느 댓글에 달려있는지를 기록															- 끝
// 댓글 하나하나 테이블 처리하는게 깔끔하겠음																	- 끝
// 로그인을 해놨다면 본인이 적은 댓글에 대하여 수정/삭제가 가능		=> 이미 로그인 중이라 비밀번호를 요구하지 않음
// Guest 이름으로 된 댓글은 로그인을 했든 안했든 수정/삭제가 보임	=> 당연히 비밀번호를 씀
// 어떤 댓글을 눌렀는지에 대한 검증이 필요함 => 버튼에 id를 달아놓으면 되겠다

// 국가에 대한 정보를 좀 더 넣는게 낫겠다
// 더미데이터나 api를 사용해서 넣으면 더 좋겠음

// join jquery cdn 넣어야한다
// 객체도 없다는건 좀 심하다
// 데이터베이스도 통일하는게 좋다

String countryName = "미국";
// countryName = request.getParameter("country");

String user = "";

CountryDAO cDao = CountryDAO.getInstance();
CountryDTO country = cDao.getCountry(countryName);
String flag = country.getFlag();
%>
<title>정보</title>
</head>
<body>
	<header>
        <h2> 여행 정보 </h2>
    </header>
    <nav>
        <button onclick="ServiceServlet">여행 정보</button>
        <button onclick="ServiceServlet">마이 페이지</button>
    </nav>
    <main>
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
        	<form method="post" action="">
        		<table>
        			<tr>
        				<th> 리뷰 쓰기 </th>
        			</tr>
        			<tr>
        				<td> <textarea name="title" placeholder="제목"></textarea> </td>
        			</tr>
        			<tr>
        				<td> <textarea name="content" placeholder="내용"></textarea> </td>
        			</tr>
        			<tr>
        				<td> <input id="range" type="range" min=1 max=10 value="5" name="score"><span id="child">5점</span></td>
        			</tr>
        			<tr>
        				<td></td>
        			</tr>
        		</table>
        		<input type="hidden" name="countryName" value=<%=countryName %>>
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
        			int pageStart = ((currentPage/10) * 10) + 1;
        			int pageEnd= (pageStart+9)*10 > reviews.size() ? ((reviews.size()-1)/10)+1 : pageStart+9;
        			
        			for(int i = reviewStart; i<=reviewEnd; i++) {
            			ReviewDTO temp = reviews.get(i);
            			%>
            			<tr><td>
            				<table>
            					<tr><td>리뷰 국가 : <%=temp.getCountryName() %></td>
            					<td>유저 이름 : <%=temp.getUserName() %></td>
            					<td>평가 점수 : <%=temp.getScore() %> 점</td></tr>
            					<tr><td colspan="3">유저 리뷰 : <%=temp.getContent()%></td></tr>
            					<tr><td colspan="2">리뷰 날짜 : <%=temp.getDate() %></td>
            					<td>
            					<button onclick="">답글</button>
            					<%
            					if(temp.getUserName().equals("Guest")) {
            						%>
                					<button onclick="modifyReviewGuest()">수정</button>
                					<button onclick="deleteReviewGuest()">삭제</button>
                					<%
            					}
            					else if(temp.getUserName().equals("")) {
            						%>
            						<button onclick="modifyReviewUser()">수정</button>
                					<button onclick="deleteReviewUser()">삭제</button>
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
	            					<tr><td><span>&#9;</span>유저 이름 : <%=rrtemp.getUserName() %></td></tr>
            						<tr><td><span>&#9;</span>유저 답글 : <%=rrtemp.getContent()%></td></tr>
            						<tr><td><span>&#9;</span>답글 날짜 : <%=rrtemp.getDate() %></td></tr>
            						<tr><td><button onclick="">답글</button>
            						<%
            						if(temp.getUserName().equals("Guest")) {
            							%>
                						<button onclick="modifyReReviewGuest()">수정</button>
                						<button onclick="deleteReReviewGuest()">삭제</button>
                						<%
            						}
            						else if(temp.getUserName().equals("")) {
            							%>
            							<button onclick="modifyReReviewUser()">수정</button>
                						<button onclick="deleteReReviewUser()">삭제</button>
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
        				%>
        				<button onclick="loaction.href='viewCountry.jsp?countryName=<%=countryName %>&currentPage=<%= currentPage-10 %>'">이전 10페이지</button>
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
        				%>
        				      <button onclick="location.href='viewCountry.jsp?countryName=<%=countryName %>&currentPage=<%= currentPage-10 %>'"></button>
        				<%
        			}
        			
        			%>
        			</td></tr>
        	
        	</table>
        </div>
    </main>
    <footer>

    </footer>
    
</body>
</html>