<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<%
	int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
	String user_nickname = (String)session.getAttribute("user_nickname");
	int family_idx = Integer.parseInt(session.getAttribute("family_idx").toString());
	
 
	    try {
	    	String sql = "INSERT INTO family_members_tb (family_idx, user_idx, user_nickname) VALUES(?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, family_idx);
	        pstmt.setInt(2, user_idx);
	        pstmt.setString(3, user_nickname);
	        pstmt.executeUpdate();
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
