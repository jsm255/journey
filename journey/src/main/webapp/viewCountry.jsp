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
    </style>

<%
String countryName = "영국";
// countryName = request.getParameter("country");

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
        	<form>
        		<table>
        			<tr>
        				<td></td>
        			</tr>
        		</table>
        	</form>
        </div>
        <div id="review">	<!-- 10개까지 표시 + 작성 창 => 11줄 / 답글 -->
        	<table>
        	<%
        		ReviewDAO rDao = ReviewDAO.getInstance();
        		ArrayList<ReviewDTO> reviews = rDao.getReviews(countryName);
        			int currentPage = 1;
        			if(request.getParameter("currentPage") != null) {
        				currentPage = Integer.parseInt(request.getParameter("currentPage"));
        			}
        			int reviewStart = (currentPage-1)*10;
        			int reviewEnd = reviewStart+9 > reviews.size()-1 ? reviews.size()-1 : reviewStart+9;
        			int pageStart = ((currentPage/10) * 10) + 1;
        			int pageEnd= (pageStart+9)*10 > reviews.size() ? ((reviews.size()-1)/10)+1 : pageStart+9;
        			
        			System.out.println(reviewStart);
        			System.out.println(reviewEnd);
        			System.out.println(pageStart);
        			System.out.println(pageEnd);
        			
        			for(int i = reviewStart; i<=reviewEnd; i++) {
            			ReviewDTO temp = reviews.get(i);
            			%>
            			<tr><td>리뷰 국가 : <%=temp.getCountryName() %></td>
            			<td>유저 이름 : <%=temp.getUserName() %></td>
            			<td>평가 점수 : <%=temp.getScore() %> 점</td>
            			<tr><td colspan="3">유저 리뷰 : <%=temp.getContent()%></td></tr>
            			<tr><td>리뷰 날짜 : <%=temp.getDate() %></td></tr>
            			<tr></tr>
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