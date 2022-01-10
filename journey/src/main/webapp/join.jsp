<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<section>
		<h1>회원가입</h1>
		<form action="">
			<div class="join-area">
				<input type="text" name = "joinId" id = "joinId" autocomplete="off" required><label for="joinId">아이디</label>
			</div>
			<div class="join-area">
				<input type="password" name = "joinPw" id = "joinPw" autocomplete="off" required><label for="joinPw">비밀번호</label>
			</div>
			<div class="join-area">
				<input type="tel" name="tel" id="tel" autocomplete="off" required><label for="tel">전화번호(-제외)</label>
			</div>
			<div class="joinBtn-area">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</section>
<script>
	
</script>
</body>
</html>