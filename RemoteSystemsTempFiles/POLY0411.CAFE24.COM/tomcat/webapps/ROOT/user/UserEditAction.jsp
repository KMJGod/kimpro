<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<%
int user_idx = (int) session.getAttribute("user_idx");

try {
    String sql = "UPDATE user_tb SET user_passwd=?, user_name=?, user_birth=?, user_gender=?, user_sns_facebook=?, user_sns_twitter=?, user_sns_instargram=? WHERE user_idx=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("user_passwd"));
    pstmt.setString(2, request.getParameter("user_name"));
    pstmt.setString(3, request.getParameter("user_birth"));
    pstmt.setString(4, request.getParameter("user_gender"));
    pstmt.setString(5, request.getParameter("user_sns_facebook"));
    pstmt.setString(6, request.getParameter("user_sns_twitter"));
    pstmt.setString(7, request.getParameter("user_sns_instargram"));
    pstmt.setInt(8, user_idx);
    pstmt.executeUpdate();

    // 세션 정보 업데이트
    session.setAttribute("user_passwd", request.getParameter("user_passwd"));
    session.setAttribute("user_name", request.getParameter("user_name"));
    session.setAttribute("user_birth", request.getParameter("user_birth"));
    session.setAttribute("user_gender", request.getParameter("user_gender"));
    session.setAttribute("user_sns_facebook", request.getParameter("user_sns_facebook"));
    session.setAttribute("user_sns_twitter", request.getParameter("user_sns_twitter"));
    session.setAttribute("user_sns_instargram", request.getParameter("user_sns_instargram"));

    response.sendRedirect("../index.jsp");
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("../index.jsp");
} finally {
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>UserEditAction</title>
</head>
<body>
    <script>
        alert("회원 정보 수정 완료");
        location.href="../index.jsp";
    </script>
</body>
</html>
