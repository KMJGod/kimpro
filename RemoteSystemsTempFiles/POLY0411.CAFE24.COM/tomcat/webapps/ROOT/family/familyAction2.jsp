<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<%
    int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
	int family_idx = 0;
	try {
	    String sql = "SELECT * FROM family_tb WHERE family_ctor_user_idx = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, user_idx);
	    rs = pstmt.executeQuery();
			
	    if (rs.next()) {
	    	family_idx = rs.getInt("family_idx");
	    	}
	    String sql1 = "UPDATE user_tb SET family_idx=? WHERE user_idx=?";
	    pstmt = conn.prepareStatement(sql1);
	    pstmt.setInt(1, family_idx);
	    pstmt.setInt(2, user_idx);
	    pstmt.executeUpdate();
	    response.sendRedirect("familyAction3.jsp");
	
	}catch (SQLException e) {
	    e.printStackTrace();
	    %>
	    <script>
	        alert("가족성공에 실패하였습니다.");
	        location.href="family.jsp";
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
