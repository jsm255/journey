<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<title>Mypage</title>
</head>
<body>
    <div>
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
                <p>＊회원정보 수정</p>
                <form action="">
                <table border="1px solid black">
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" value="">getName</td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="id" value="">getId</td>
                    </tr>
                    <tr>
                        <th>비밀번호 변경</th>
                        <td><input type="password" name="pw">setPw</td>
                    </tr>
                </table>
                <div><input type="button" value="수정" onclick="" ></div> 
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