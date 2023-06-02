<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>
<%
ResultSet read;
ResultSet noRead;
int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString()); //접속 유저idx

//안읽은 메세지를 가져오는 sql문
String noReadMsg = "SELECT * FROM msg_tb WHERE msg_receive_idx = ? AND msg_readok IS NULL";
pstmt = conn.prepareStatement(noReadMsg);	
pstmt.setInt(1, user_idx);
noRead = pstmt.executeQuery();

//읽은 메세지를 가져오는 sql문
String readMsg ="SELECT * FROM msg_tb WHERE msg_receive_idx = ? AND msg_readok IS NOT NULL";
pstmt = conn.prepareStatement(readMsg);	
pstmt.setInt(1, user_idx);
read = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						                <li><a href="../friends/FriendsList.jsp">친구</a></li>
						                <li><a href="../friends/Friend.jsp">친구추가</a></li>
						                <li><a href="../friends/FriendCheck.jsp">받은친구신청</a></li>
						                <li><a href="MsgSend.jsp">메시지 보내기</a></li>
						                <li><a href="MsgCheck.jsp">메시지 확인</a></li>
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
<table>
<h4 style="margin-left:15px"> 읽지 않은 메세지</h4>
<% while (noRead.next()){%>
		<form action="MsgCheckAction.jsp" method="post">
			<h3><%= noRead.getString("msg_send_nickname")%>님이 작성한 메세지입니다.</h3>
			<h3>메세지 제목: <%=noRead.getString("msg_title") %></h3>
			<h4>메세지 내용: <%=noRead.getString("msg_content") %></h4>
			<h4>발송시간: <%=noRead.getDate("msg_datetime") %></h4>
			<input type="hidden" value="<%= noRead.getInt("msg_idx")%>" name="msg_idx">
			<button>확인</button>
		</form>
		<form action="MsgDeleteAction.jsp" method="post">
			<input type="hidden" value="<%= noRead.getInt("msg_idx")%>" name="msg_idx">
			<button>삭제</button>
		</form>
<%} %>
</table>
<table>
<h4 style="margin-left:15px; margin-top: 100px"> 읽은 메세지</h4>
<% while (read.next()){%>
	<tr>
		<form action="MsgDeleteAction.jsp" method="post">
			<h3><%= read.getString("msg_send_nickname")%>님이 작성한 메세지입니다.</h3>
			<h3>메세지 제목: <%=read.getString("msg_title") %></h3>
			<h4>메세지 내용: <%=read.getString("msg_content") %></h4>
			<h4>발송시간: <%=read.getDate("msg_datetime") %></h4>
			<input type="hidden" value="<%= read.getInt("msg_idx")%>" name="msg_idx">
			<button>삭제</button>
		</form>
	</tr>
<%} %>
</table>
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