<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" type="text/css">
<link rel="stylesheet" href="css/all.css" type="text/css">
<title>MAIN</title>
</head>
<body>
	<div class=wrap>
    <c:import url="header.jsp"/>
    <div class="image">
     <main>
        <h1 class="mainTitle">어디로 떠나실건가요?</h1>
        <form method="get" action="service">
        <select size="1" class="country" name="country">
            <option  value="미국">미국</option>
            <option  value="영국">영국</option>
            <option  value="일본">일본</option>
            <option  value="태국">태국</option>
            <option  value="중국">중국</option>
            <option  value="필리핀">필리핀</option>
            <option  value="독일">독일</option>
            <option  value="이탈리아">이탈리아</option>
            <option  value="그리스">그리스</option>
            <option  value="인도">인도</option>
        </select>
        <button type="submit" class="button">
            <span class="button_icon">
                <ion-icon name="search-outline"></ion-icon>
            </span>
        </button>
       	<input type="hidden" name="command" value="viewCountry">
        </form>
    </main>
    <c:import url="footer.jsp"/>
</div>
</div>
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
</body>
</html>