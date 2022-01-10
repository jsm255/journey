<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
    <section class = "login-form">
        <h1>로그인</h1>
        <form action="">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required><label for="id">아이디</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required><label for="pw">비밀번호</label>
            </div>
            <div class = "btn-area">
                <button type="submit">로그인</button>
            </div>
        </form>
    </section>
		${sessionScope.user.joinId} <br>
		${sessionScope.user.joinPw}	<br>
		${sessionScope.user.userName}<br>
		${sessionScope.user.tel}<br>
    <script>
		
    </script>
</body>
</html>