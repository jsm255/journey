<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="header.jsp" />
	<div>
	<input type  ="hidden" name = "command" value = "">
	
		<input type="text" name="contryName" id="contryName"/>
		
		<input type = "" name = "score" id = "score" />
		
		<input type = "text" name = "headText" id = "headText" >
		
		<input type = "text" name = "bodyText" id = "bodyText">
		
	</div>

</body>
</html>