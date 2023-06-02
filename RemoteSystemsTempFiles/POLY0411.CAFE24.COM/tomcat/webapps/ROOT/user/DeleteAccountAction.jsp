<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<%
    String user_id = request.getParameter("user_id");
    String user_passwd = request.getParameter("user_passwd");

    try {
        String sql = "SELECT * FROM user_tb WHERE user_id = ? AND user_passwd = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_passwd);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String deleteSql = "DELETE FROM user_tb WHERE user_id = ? AND user_passwd = ?";
            pstmt = conn.prepareStatement(deleteSql);
            pstmt.setString(1, user_id);
            pstmt.setString(2, user_passwd);
            pstmt.executeUpdate();
            session.invalidate();
            response.sendRedirect("../index.jsp");
        } else {
            %>
            <script>
                alert("아이디와 비밀번호가 일치하지 않습니다.");
                location.href="DeleteAccount.jsp";
            </script>
            <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <script>
            alert("회원 탈퇴에 실패하였습니다.");
            location.href="DeleteAccount.jsp";
        </script>
        <%
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
