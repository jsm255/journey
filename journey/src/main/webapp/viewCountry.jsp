<%@page import="models.CountryDTO"%>
<%@page import="controllers.CountryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style>
        *{
            margin: 0;
            padding: 0;
        }

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
    </style>

<%
String countryName = "미국";
// countryName = request.getParameter("");

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
                <td rowspan="4"> 국기 들어갈 자리 </td>
            </tr>
            <tr>
                <td><%=country.getCountryName() %></td>
            </tr>
            <tr>
                <td><%=country.getScore() %> 점</td>
            </tr>
            <tr>
                <td>비워둔 자리 ㄴ</td>
            </tr>
        	</table>
        </div>
        <div id="review">
        	
        </div>
    </main>
    <footer>

    </footer>
</body>
</html>