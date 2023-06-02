<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>
<!DOCTYPE HTML>
<%
	int user_idx = (int)session.getAttribute("user_idx");
	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
	String user_nickname = (String)session.getAttribute("user_nickname");
	
	String sql = "SELECT * FROM family_tb WHERE family_ctor_user_idx = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, user_idx);
    rs = pstmt.executeQuery();
%>
<html>
	<head>
		<title>가족페이지</title>
	</head>
	<body>	
		<% if(rs.next()){ %>
			<h1>가족이있습니다!</h1>
		<%}else{ %>
			<h1>가족이 없습니다!</h1>
		<%} %>
	</body>
</html>