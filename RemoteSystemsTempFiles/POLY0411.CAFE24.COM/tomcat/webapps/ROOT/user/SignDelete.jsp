<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test</title>
</head>
<body>
<h2><%= session.getAttribute("user_id")  %>입니다.</h2>
<h2><%= session.getAttribute("user_passwd")  %>입니다.</h2>


</body>
</html>