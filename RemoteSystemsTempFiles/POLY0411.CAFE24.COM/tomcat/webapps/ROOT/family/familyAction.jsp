<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>

<%
	int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
	String user_name = (String) session.getAttribute("user_name");
	String user_nickname = (String) session.getAttribute("user_nickname");
	int family_idx = Integer.parseInt(session.getAttribute("family_idx").toString());
	
 	// 친구코드 생성 중복X
    int familyCode = 0;
    boolean isFamilyCodeExists = true;
    while (isFamilyCodeExists) {
        // 4자리 난수 생성
        familyCode = (int)(Math.random() * 9000) + 1000;
        try {
            String sql = "SELECT COUNT(*) FROM family_tb WHERE family_code=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, familyCode);
            rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
            	isFamilyCodeExists = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (family_idx == 0){ 
	    try {
	    	String sql = "INSERT INTO family_tb (family_ctor_user_idx, family_ctor_user_name, family_ctor_user_nickname, family_code) VALUES(?,?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, user_idx);
	        pstmt.setString(2, user_name);
	        pstmt.setString(3, user_nickname);
	        pstmt.setInt(4, familyCode);
	        pstmt.executeUpdate();
	        response.sendRedirect("familyAction2.jsp");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect("familyAction2.jsp");
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
    }else{
    	response.sendRedirect("../index.jsp");
    }
     
%>
