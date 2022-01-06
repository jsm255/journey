<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style>
	
	input[type = "text"]{
		padding : 10px;
		border :  solid 1px;
	}
	
	input[type = "password"]{
		padding : 10px;
		border : solid 1px;
	}
	
	input[type = "button"]{
		cursor : pointer;
		padding : 10px;
		border : none;
		color : white;
		background : blue;
	}
	</style>

<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method = "post" action="">
		<span>ID&#9;</span> </a><input type = "text" name = "id"> <br>
		<span>PW&#9;</span> </a><input type = "password" name = "pw"> <br>
		<span>name&#9;</span><input type = "text" name = "name"> <br>
		<input type = "button" onclick = "checkInfo(form)" value = "회원가입">
	</form>
</body>
</html>