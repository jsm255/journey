<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="views/css/body.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
   <header>
        <div class="top">
            <ul class="top-menu">
                <li class="join"><a href="">
                        <p>회원가입</p>
                    </a></li>
                <li class="join"><a href="">
                        <p>로그인</p>
                    </a></li>
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
    <div class="image">
     <main>
        <h1 class="mainTitle">어디로 떠나실건가요?</h1>
        <form action="get" method="">
        <select size="1" class="country" name="country">
            
            <option value="country">미국</option>
            <option value="country">영국</option>
            <option value="country">일본</option>
            <option value="country">태국</option>
            <option value="country">중국</option>
            <option value="country">필리핀</option>
            <option value="country">독일</option>
            <option value="country">이탈리아</option>
            <option value="country">그리스</option>
            <option value="country">인도</option>
        </select> 
        <input type="button" onclick="" value="검색">
        </form>
    </main>
    <footer>
        <p> Copyright © TravelCommunity. All Rights Reserved.</p>
    </footer>
</div>
 
</body>
</html>