<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>
<%
int friends_req_idx = Integer.parseInt(request.getParameter("friends_req_idx")); //친구추가 req에 있는 idx값을 받아옴 

//아래로 friends_request_tb테이블의 정보를 가져오기 위한 쿼리문
String select_friends_req_tb= "SELECT * FROM friends_request_tb WHERE friends_req_idx = ?";
pstmt = conn.prepareStatement(select_friends_req_tb);
pstmt.setInt(1, friends_req_idx);
rs = pstmt.executeQuery();
int req_user_idx = 0;
String req_user_nickname = null;
int get_user_idx = 0;
String get_user_nickname = null;
if(rs.next()){
	req_user_idx = rs.getInt("req_user_idx"); //친구 신청자 idx
	req_user_nickname = rs.getString("req_user_nickname"); //친구 신청자 닉네임
	get_user_idx = rs.getInt("get_user_idx"); //친구 요청 받은사람 idx
	get_user_nickname = rs.getString("get_user_nickname");//친구 요청 받은사람 닉네임
}

//아래로 friends_request_tb테이블의 add_friends_list의 내용을 변경
//추가하면 if문을 이용해서 add_friends_list값이 null일 경우만 작동되게 바꿔줘야 함 
String update_friends_req_tb= "UPDATE friends_request_tb SET add_friends_list = 'T' WHERE friends_req_idx = ?";
pstmt = conn.prepareStatement(update_friends_req_tb);
pstmt.setInt(1, friends_req_idx);
pstmt.executeUpdate();

//아래로 friends_list_tb테이블에 친구추가 정보들을 insert 함 각각의 위치를 바꿔 2번 insert를 진행
//예외 처리는 try finally문을 사용해야한다. 오류가 뜨면 그냥 대충 예외 메시지 띄워 놓으면 된다.
String insert_friends_list_tb1= "INSERT INTO friends_list_tb (req_user_idx, req_user_nickname, get_user_idx, get_user_nickname)VALUES (?, ?, ?, ?)";
pstmt = conn.prepareStatement(insert_friends_list_tb1);
pstmt.setInt(1, req_user_idx);
pstmt.setString(2, req_user_nickname);
pstmt.setInt(3, get_user_idx);
pstmt.setString(4, get_user_nickname);
pstmt.executeUpdate();

String insert_friends_list_tb2= "INSERT INTO friends_list_tb (req_user_idx, req_user_nickname, get_user_idx, get_user_nickname)VALUES (?, ?, ?, ?)";
pstmt = conn.prepareStatement(insert_friends_list_tb2);
pstmt.setInt(1, get_user_idx);
pstmt.setString(2, get_user_nickname);
pstmt.setInt(3, req_user_idx);
pstmt.setString(4, req_user_nickname);
pstmt.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%=req_user_idx %></h1>
<h1><%=req_user_nickname %></h1>
<h1><%=get_user_idx %></h1>
<h1><%=get_user_nickname %></h1>
</body>
</html>