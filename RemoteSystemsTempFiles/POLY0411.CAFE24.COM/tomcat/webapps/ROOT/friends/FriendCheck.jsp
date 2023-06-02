<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>
<%
	int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString()); //접속 유저idx

	//친구추가 request 테이블에 있는 요청 목록중 현재 idx와 비교해서 값을 가지고 옴
	String sql = "SELECT * FROM friends_request_tb WHERE get_user_idx = ? and add_friends_list IS NULL";
	pstmt = conn.prepareStatement(sql);	
	pstmt.setInt(1, user_idx);
	rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/mainn.css" />
	<noscript><link rel="stylesheet" href="../assets/css/noscriptt.css" /></noscript>
<title>Insert title here</title>
</head>
<body class="is-preload">
<div id="wrapper">
			<!-- Header -->
					<header id="header" class="alt">
						<!-- Logo -->
						<a href="../index.jsp" class="logo"><strong>자랑스러운</strong> <span>1조</span></a>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>
					
				<!-- Menu -->
					<nav id="menu">
					
					<!--  사용자가 로그인한 경우에만 버튼이 표시  -->
										
						<ul class="links">
						    <% if (session.getAttribute("user_id") != null) { %>
						        <li><a href="../user/LogoutAction.jsp">로그아웃</a></li>
						        <li><a href="#">내정보</a></li>
						        <li><a href="#">메인기능</a></li>
						        <li id="community" onmouseover="showLinks2()" onmouseout="hideLinks2()"><a href="#">커뮤니티</a>
						            <ul class="links2" id="links2">
						                <li><a href="../board/boardmain.jsp">게시판</a></li>
						            </ul>
						        </li>    
						        <li id="friendinfo" onmouseover="showLinks3()" onmouseout="hideLinks3()"><a href="#">친구관리</a>
						            <ul class="links3" id="links3">
						                <li><a href="FriendsList.jsp">친구</a></li>
						                <li><a href="Friend.jsp">친구추가</a></li>
						                <li><a href="FriendCheck.jsp">받은친구신청</a></li>
						                <li><a href="../message/MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="../message/MsgCheck.jsp">메시지 확인</a></li>
						            </ul>						        
						        </li>
						    <% } %>    
						</ul>
						
						<script>
						    function showLinks2() {
						        var links2 = document.getElementById("links2");
						        links2.style.display = "block";
						    }
						    
						    function hideLinks2() {
						        var links2 = document.getElementById("links2");
						        links2.style.display = "none";
						    }
						
						    function showLinks3() {
						        var links3 = document.getElementById("links3");
						        links3.style.display = "block";
						    }
						    
						    function hideLinks3() {
						        var links3 = document.getElementById("links3");
						        links3.style.display = "none";
						    }
						</script>					
						
					<!--  사용자가 로그인하지 않은 경우에만 로그인 및 회원가입 버튼이 표시  -->
						
						<ul class="actions stacked">
						<% if (session.getAttribute("user_id") == null) { %>
							<li><a href="Login.jsp" class="button primary fit" style="width: 75%;">로그인</a></li>
							<li><a href="SignUp.jsp" class="button fit" style="width: 75%;">회원가입</a></li>
						<% } %>	
						</ul>
					</nav>
	<% while (rs.next()){%>
	<tr>
		<form action="FriendCheckOKAction.jsp" method="post">
			<td><%= rs.getString("req_user_nickname")%>님이 친구 추가 요청을 보냈습니다.</td>
			<input type="hidden" value="<%= rs.getString("friends_req_idx")%>" name="friends_req_idx">
			<button>수락</button>
		</form>
		<form action="FriendCheckNOAction.jsp" method="post">
			<input type="hidden" value="<%= rs.getString("friends_req_idx")%>" name="friends_req_idx">
			<button>거절</button>
		</form>
	</tr>
	<%} %>
		</div>
	<!-- Scripts -->

			<script src="../assets/js/jquery.minn.js"></script>
			<script src="../assets/js/jquery.scrolly.minn.js"></script>
			<script src="../assets/js/jquery.scrollex.minn.js"></script>
			<script src="../assets/js/browser.minn.js"></script>
			<script src="../assets/js/breakpoints.minn.js"></script>
			<script src="../assets/js/utiln.js"></script>
			<script src="../assets/js/mainn.js"></script>
</body>
</html>


