<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<title>CommentAction</title>
    <%	
    int boardIdx = Integer.parseInt(request.getParameter("idx"));
    
	
	// 현재 로그인한 사용자 정보 조회
    String userNickname = (String) session.getAttribute("user_nickname");
    int userIdx = (int) session.getAttribute("user_idx");
    %>
</head>
</html>