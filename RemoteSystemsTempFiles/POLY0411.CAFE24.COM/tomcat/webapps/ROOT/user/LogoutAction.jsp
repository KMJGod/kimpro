<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 액션</title>
</head>
<body>
<script>
    <% 
        session.invalidate(); 
        String message = "로그아웃 완료"; 
    %>
    alert("<%= message %>");
    location.href="../index.jsp";
</script>

</body>
</html>