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
				<input type="text" name = "id" id = "id" placeholder = "${sessionScope.user.id}" autocomplete="off" required><label for="joinId">아이디</label>
			</div>
			<div class="join-area">
				<input type="password" name = "pw" id = "pw" value = "${sessionScope.user.pw}" autocomplete="off"  required><label for="joinPw">비밀번호</label>
			</div>
			<div class="join-area">
				<input type="text" name = "userName" id = "userName"value = "${sessionScope.user.userName}" autocomplete="off"  required><label for="joinName">이름</label>
			</div>
			<div class="join-area">
				<%-- <input type="number" name="tel" id="tel" value = "${sessionScope.user.tel}" maxlength = "11" placeholder ="숫자만 입력하세요" autocomplete="off"  required><label for="tel">전화번호(-제외)</label> --%>
				<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength = 11/>
			</div>
			<div class="joinBtn-area">
				<!-- <button type="submit">회원가입</button> -->
				<input type = "submit" value = "회원가입">
			</div>
		</form>
	</section>

</body>
</html>