<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   
<title>Insert title here</title>
</head>

<body>
	<section>
		<h1>회원가입</h1>
		<form action="service" method = "POST">
		 <input type="hidden" name="command" value="join">
			<div class="join-area">
				<input type="text" name = "id" id = "id" placeholder = "${sessionScope.checkId}" value = "${sessionScope.user.id}"autocomplete="off" required><label for="joinId">아이디</label>
			</div>
			<div class="join-area">
				<input type="password" name = "pw" id = "pw" value = "${sessionScope.user.pw}" autocomplete="off"  required><label for="joinPw">비밀번호</label>
			</div>
			<div class="join-area">
				<input type="text" name = "userName" id = "userName"value = "${sessionScope.user.userName}" autocomplete="off"  required><label for="joinName">이름</label>
			</div>
			<div class="join-area">
				<input type="text" name = "tel" id = "tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength = 11 placeholder = "${sessionScope.checkTel}" value = "${sessionScope.user.tel}"/> <label >전화번호를 입력하세요</label>
			</div>
			<div class="joinBtn-area">
				<!-- <button type="submit">회원가입</button> -->
				<input type = "submit" value = "회원가입">
			</div>
		</form>
	</section>

</body>
</html>