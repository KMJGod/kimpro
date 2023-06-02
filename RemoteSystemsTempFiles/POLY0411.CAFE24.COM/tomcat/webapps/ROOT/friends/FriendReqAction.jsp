<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>

<%


	int req_user_idx = Integer.parseInt(session.getAttribute("user_idx").toString()); //접속 유저idx
	String get_user_friend_code = request.getParameter("friend_code"); //친구요청 대상자의 친구코드
	int get_user_idx = 0; 
	String get_user_nickname = null;
	
	//친구추가할 사람의 정보를 불러옴 
	String sql = "select * from user_tb where user_friend_code = ?";
	pstmt = conn.prepareStatement(sql);	
	pstmt.setString(1, get_user_friend_code);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		get_user_idx = rs.getInt("user_idx"); //친구요청 대상자의 유저idx
		get_user_nickname = rs.getString("user_nickname"); //친구요창 대상자의 유저닉네임
		%> <h1><%= get_user_idx %></h1>
		<h1><%= get_user_nickname %></h1>
		<%
	}
	
	
	//SQL문은 friends_list_tb에 현재 유저idx와 상대방의 유저idx가 존재하는지 확인하는 코드
	String sql1 = "SELECT COUNT(*) FROM friends_list_tb WHERE req_user_idx = ? AND get_user_idx = ?";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setInt(1, req_user_idx);
	pstmt.setInt(2, get_user_idx);		
	rs = pstmt.executeQuery();
	int count1 = 0;
	if(rs.next()){
		//count의 값은 slq1의 값을 확인 count가 0이어야하고 1이상이면 친구초대 불가 
		//count가 0이 아니라면 친구로 이미 존재함
		count1 = rs.getInt(1); 
	%> <h1><%= count1 %></h1>
	<%
	}
	
	
	//SQL문은 friends_request_tb안에서 신청자idx, 친구요청대상자idx, 승인여부의 T를 받아서 count에 넣음
	String sql2 = "SELECT COUNT(*) FROM friends_request_tb WHERE req_user_idx = ? AND get_user_idx = ? AND (add_friends_list IS NULL OR add_friends_list = 'T')";	
	pstmt = conn.prepareStatement(sql2);
	pstmt.setInt(1, req_user_idx);
	pstmt.setInt(2, get_user_idx);
	rs = pstmt.executeQuery();
	int count2 = 0;
	if(rs.next()){
		//count의 값은 slq2의 값을 확인 count가 0이어야하고 1이상이면 친구초대 불가 
		//count가 0이 아니라면 친구로 이미 존재함
		count2 = rs.getInt(1); 
	%> <h1><%= count2 %></h1>
	<%
	}
	
	//SQL문은 friends_request_tb안에서 신청자idx, 친구요청대상자idx, 승인여부의 T를 받아서 count에 넣음
		String sql3 = "SELECT COUNT(*) FROM friends_request_tb WHERE req_user_idx = ? AND get_user_idx = ? AND (add_friends_list IS NULL OR add_friends_list = 'T')";	
		pstmt = conn.prepareStatement(sql3);
		pstmt.setInt(1, get_user_idx);
		pstmt.setInt(2, req_user_idx);
		rs = pstmt.executeQuery();
		int count3 = 0;
		if(rs.next()){
			//count의 값은 slq2의 값을 확인 count가 0이어야하고 1이상이면 친구초대 불가 
			//count가 0이 아니라면 친구로 이미 존재함
			count3 = rs.getInt(1); 
		%> <h1><%= count3 %></h1>
		<%
		}
	
	//카운트 둘다 0일경우 insert문을 사용한다.
	if(count1 == 0 && count2 == 0 && count3 == 0){
		String insert_friend_req_sql = "INSERT INTO friends_request_tb(req_user_idx,req_user_nickname,get_user_idx,get_user_nickname,get_user_friend_code)VALUES(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(insert_friend_req_sql);
		pstmt.setInt(1, req_user_idx);
		pstmt.setString(2, (String)session.getAttribute("user_nickname"));
		pstmt.setInt(3, get_user_idx);
		pstmt.setString(4, get_user_nickname);
		pstmt.setString(5, get_user_friend_code); //친구초대 코드
		pstmt.executeUpdate();
		%><h1> 성공적으로 작동? <%= (String)session.getAttribute("user_nickname") %></h1> <%
	}else{
		%>
		<h1>이미 존재한다.</h1>
		<%
	}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>